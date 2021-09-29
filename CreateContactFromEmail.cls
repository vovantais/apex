global class CreateContactFromEmail implements Messaging.InboundEmailHandler {

    public static final String SUB_TO_COMPARE = 'Create Contact';
    public static final String INSERT_CONTACT_FAILED = 'The error to insert Contact';
 
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,

    Messaging.InboundEnvelope envelope) {

    Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();

    if (email.subject.equalsIgnoreCase(SUB_TO_COMPARE)) {

        try {
        Contact cont = new Contact();

        cont.LastName = email.plainTextBody;

        insert cont;
            
        } catch (Exception err) {
            throw new GlobalException(INSERT_CONTACT_FAILED);
        }
    }

    result.success = true;

    return result;
}
