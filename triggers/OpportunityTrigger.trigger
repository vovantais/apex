trigger OpportunityTrigger on Opportunity (before insert, before update) {
    if (OpportunityTriggerHandler.enablesTrigger) {
        if (Trigger.isBefore && Trigger.isInsert) {
            OpportunityTriggerHandler.setOpportunityRecordType(Trigger.new);

            OpportunityTriggerHandler.setOpportunityFields(Trigger.new);
        }
    }
}