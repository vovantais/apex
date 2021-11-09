public class EventTriggerHandler {
	
    public static Boolean enablesTrigger = true;
    private static final String TEST_EVENT_CONNECTION = 'TEST EVENT Connection';
    private static final String MAIL_ADDRESS = 'vladimir0297@mail.ru';
    
    public static void sendEmailMessage(List<testPlatformEvent__e> platformEvents) {
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        if (platformEvents.size() > 0) {
            for (testPlatformEvent__e evt : platformEvents) {
                Messaging.SingleEmailMessage gmail = new Messaging.SingleEmailMessage();
                List<String> sendTo = new List<String>();
                sendTo.add(MAIL_ADDRESS);
                gmail.setToAddresses(sendTo);
                gmail.setSubject(TEST_EVENT_CONNECTION);
                gmail.setHtmlBody(evt.testTextField__c);
                mails.add(gmail);
            }
            Messaging.sendEmail(mails); 
        }
    }
}