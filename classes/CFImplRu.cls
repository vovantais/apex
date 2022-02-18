    public Account blockCompany(Account account) {
        //exclude some Stages of Opportunity
        List<String> excludeStages = new List<String> {
                GlobalUtils.getOpportunityStageName(GlobalUtils.OpportunityStage.MovedToStart),
                GlobalUtils.getOpportunityStageName(GlobalUtils.OpportunityStage.Refused)
        };
        //get List of Opportunities in work
//        List<Opportunity> opportunitiesInWork = cfRuDao.getOpportunitiesByAccountIdAndStages(account.Id, excludeStages);
        Map<Id, Opportunity> opportunitiesInWork = new Map<Id, Opportunity>(cfRuDao.getOpportunitiesByAccountIdAndStages(account.Id, excludeStages));
        List<ProcessInstance> approvalHistory = [
                SELECT Status , ProcessDefinition.Name
                FROM ProcessInstance
                WHERE TargetObjectId IN :opportunitiesInWork.keySet()
                AND Status =: ApprovalService.APPROVED
                AND (ProcessDefinition.Name = 'Re_RU_Creditrisk' OR ProcessDefinition.Name = 'RU_Creditrisk')];
        System.debug('approvalHistory === ' + approvalHistory);
//        Id ownerId = CFUtils.getCFSettingsFor(GlobalUtils.FleetcorCountries.Russia.name()).Blocked_companies_owner_ID__c;
        //block Opportunities and Account
        switch on blockReason {
            when SPARK {
                //if organization is not acting in SPARK
                account.Organization_Type__c = CFUtils.COMPANY_NON_ACTIVE;
            }
            when BlackList, Scoring, Prescoring {
                //if organization is denied by credit or black list check
                account.Type = CFUtils.COMPANY_DENIAL;
            }
        }
//        account.OwnerId = ownerId;
        //todo here
        for (Opportunity opp : opportunitiesInWork.values()) {
            if (approvalHistory == null || approvalHistory.isEmpty()) {
                opp.StageName = GlobalUtils.getOpportunityStageName(GlobalUtils.OpportunityStage.Refused);
                opp.PPR_Lost_Reasons__c = CFUtils.OPPORTUNITY_LOST_REASON;
            }
        }
        //update all Account records
        List<SObject> toUpdate = new List<SObject>();
        toUpdate.addAll(opportunitiesInWork.values());
        toUpdate.add(account);
        cfRuDao.updateSObjects(toUpdate);
        System.debug('********* COMPANY BLOCKED *************');
        return account;
    }
