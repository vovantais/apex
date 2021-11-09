trigger EventTrigger on testPlatformEvent__e (after insert) {
    
    if (EventTriggerHandler.enablesTrigger) {
        if (Trigger.isInsert) {
           	EventTriggerHandler.sendEmailMessage(Trigger.New); 
        }
    }
}