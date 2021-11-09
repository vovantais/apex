trigger CheckCase on Case (after update) {
    
    if (CaseTriggerHandler.enablesTrigger) {
        if (Trigger.isUpdate) {
            CaseTriggerHandler.callPlatformEvent(Trigger.New); 
        }
    }
}