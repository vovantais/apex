
public class ContactHandlerSoap implements Queueable, Database.AllowsCallouts {

    public void execute(QueueableContext param) {
        createContact();
    }

    public void createContact() {
        partnerSoapSforceCom.Soap myPartnerSoap = new partnerSoapSforceCom.Soap();
        partnerSoapSforceCom.LoginResult partnerLoginResult = myPartnerSoap.login('vladimir0297@mail.ru', 'testTrail97cxqCVAUL7u67f6zhctVKWCKR');
        soapSforceComSchemasClassSoapwebser.SessionHeader_element webserviceSessionHeader = new soapSforceComSchemasClassSoapwebser.SessionHeader_element();
        webserviceSessionHeader.sessionId = partnerLoginResult.sessionId;
        soapSforceComSchemasClassSoapwebser.SOAPWebService myWebservice = new soapSforceComSchemasClassSoapwebser.SOAPWebService();
        myWebservice.SessionHeader = webserviceSessionHeader;
        myWebservice.makeContact('lastName');
    }

}