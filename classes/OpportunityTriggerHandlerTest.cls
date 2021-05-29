@IsTest
private with sharing class OpportunityTriggerHandlerTest {

    private static ApexPages.Message errMessage = new ApexPages.Message(ApexPages.Severity.FATAL,
            OpportunityTriggerHandler.textUtils.OPPORTUNITY_LIST_ERROR);

    @TestSetup
    private static void createTestData() {
        Opportunity opp = new Opportunity(
                Name = 'Test',
                CloseDate = Date.today(),
                StageName = 'Prospecting',
                Country__c = 'USA',
                LeadSource = 'Other',
                DeliveryInstallationStatus__c = 'Completed',
                Type = 'Existing Customer - Downgrade',
                NextStep = '',
                Description = ''
        );
        insert opp;
    }

    @IsTest
    private static void getOpportunityRecordTypesTest() {
        Map<String, RecordTypeInfo> opportunityRecordTypes = OpportunityTriggerHandler.getOpportunityRecordTypes();

        System.assertNotEquals(0, opportunityRecordTypes.size());
        System.assertEquals(true, opportunityRecordTypes.containsKey(
                OpportunityTriggerHandler.textUtils.USA_OPPORTUNITY_RECORD_TYPE_NAME));
    }

    @IsTest
    private static void setOpportunityRecordTypeTest() {
        List<Opportunity> opp = [SELECT Id, Country__c FROM Opportunity];
        Id oppRecordTypeId = OpportunityTriggerHandler.getOpportunityRecordTypes()
                .get(OpportunityTriggerHandler.textUtils.USA_OPPORTUNITY_RECORD_TYPE_NAME).getRecordTypeId();

        OpportunityTriggerHandler.setOpportunityRecordType(null);

        System.assertEquals(OpportunityTriggerHandler.textUtils.OPPORTUNITY_LIST_ERROR, errMessage.getSummary());

        OpportunityTriggerHandler.setOpportunityRecordType(opp);

        System.assertNotEquals(0, opp.size());
        System.assertEquals(oppRecordTypeId, opp[0].RecordTypeId);

    }

    @IsTest
    private static void setOpportunityFieldsTest() {
        List<Opportunity> opp = [SELECT Id, LeadSource, Type, DeliveryInstallationStatus__c, Description, NextStep FROM Opportunity];

        OpportunityTriggerHandler.setOpportunityFields(null);

        System.assertEquals(OpportunityTriggerHandler.textUtils.OPPORTUNITY_LIST_ERROR, errMessage.getSummary());

        OpportunityTriggerHandler.setOpportunityFields(opp);

        System.assertNotEquals(0, opp.size());
        System.assertEquals(opp[0].DeliveryInstallationStatus__c, 'Completed');
        System.assertEquals(opp[0].Description, OpportunityTriggerHandler.textUtils.OPPORTUNITY_DESCRIPTION);
        System.assertEquals(opp[0].NextStep, OpportunityTriggerHandler.textUtils.OPPORTUNITY_NEXT_STEP);
    }
}