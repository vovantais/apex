public with sharing class OpportunityTriggerHandler {

    public static Boolean enablesTrigger = true;
    public static OpportunityGlobalTextUtils textUtils = new OpportunityGlobalTextUtils();

    public static Map<String, RecordTypeInfo> getOpportunityRecordTypes() {
        return Schema.getGlobalDescribe().get(textUtils.OPPORTUNITY_NAME)
                .getDescribe().getRecordTypeInfosByDeveloperName();
    }

    public static void setOpportunityRecordType(List<Opportunity> oppList) {
        if (oppList != null) {
            for (Opportunity opp : oppList) {
                if (opp.Country__c == textUtils.OPPORTUNITY_COUNTRY_USA) {
                    opp.RecordTypeId = getOpportunityRecordTypes()
                            .get(textUtils.USA_OPPORTUNITY_RECORD_TYPE_NAME).getRecordTypeId();
                } else {
                    opp.RecordTypeId = getOpportunityRecordTypes()
                            .get(textUtils.UK_OPPORTUNITY_RECORD_TYPE_NAME).getRecordTypeId();
                }
            }
        } else {
            new ApexPages.Message(ApexPages.Severity.FATAL, OpportunityTriggerHandler.textUtils.OPPORTUNITY_LIST_ERROR);
            return;
        }
    }

    public static void setOpportunityFields(List<Opportunity> oppList) {
        if (oppList != null) {
            for (Opportunity opp : oppList) {
                if (String.isBlank(opp.Type)) {
                    opp.Type = textUtils.OPPORTUNITY_NEW_CUSTOMER;
                }
                if (String.isBlank(opp.Description)) {
                    opp.Description = textUtils.OPPORTUNITY_DESCRIPTION;
                }
                if (String.isBlank(opp.NextStep)) {
                    opp.NextStep = textUtils.OPPORTUNITY_NEXT_STEP;
                }
                if (String.isBlank(opp.LeadSource)) {
                    opp.LeadSource = textUtils.OPPORTUNITY_LEAD_SOURCE;
                }
                if (String.isBlank(opp.DeliveryInstallationStatus__c)) {
                    opp.DeliveryInstallationStatus__c = textUtils.OPPORTUNITY_DELIVERY_INSTALLATION_STATUS;
                }
            }
        } else {
            new ApexPages.Message(ApexPages.Severity.ERROR, textUtils.OPPORTUNITY_LIST_ERROR);
            return;
        }
    }
}