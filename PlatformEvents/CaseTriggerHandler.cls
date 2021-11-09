public class CaseTriggerHandler {
    
	public static Boolean enablesTrigger = true;
    private static final String CASE_STATUS_RESOLVED = 'Resolved';
    private static final String TEST_EVENT_MESSAGE = 'TEST EVENT MESSAGE';
    
    public static void callPlatformEvent(List<Case> cases) {
        
        if (cases.size() > 0) { 
            for (Case singleCase : cases) {
                if (singleCase.Status == CASE_STATUS_RESOLVED) {
                    testPlatformEvent__e evt = new testPlatformEvent__e(); 
                    evt.testTextField__c = TEST_EVENT_MESSAGE; 
                    EventBus.publish(evt);  
                }
        	}  
    	}
    }
}