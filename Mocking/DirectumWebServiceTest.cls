@IsTest
public with sharing class DirectumWebServiceTest {

    public static final String URL = 'https://api.eu-de.apiconnect.appdomain.cloud';
    public static final String RESPONSE_BODY = '{"DocumentKind": 25, "BusinessUnit": "77", "Subject": "111",' +
            '"Department": 99, "ResponsibleEmployee": 101,"Counterparty": "Софтлайн Трейд|7736227885|770401001|119270,' +
            ' МОСКВА ГОРОД, НАБЕРЕЖНАЯ ЛУЖНЕЦКАЯ, 2/4, СТР.3А, ОФИС 304|Г МОСКВА,' +
            'УЛ ГУБКИНА, Д 8|7555555|softline@softline.ru|1027736009333|ОКПО|2782534392520000066","RequestID": "string"}';

    @TestSetup
    public static void initCustomSettings() {
        insert new IBM_Gateway__c(
                Name = 'directumCredentials',
                IBM_CLIENT_ID__c = '005056bd4e10',
                CLIENT_SECRET__c = '628c49df',
                URL__c = 'https://api.eu-de.apiconnect.appdomain.cloud'
        );
    }

    @IsTest
    public static void createContractPositiveTest() {

        Test.setMock(HttpCalloutMock.class, new SingleRequestMock(200, 'Complete', RESPONSE_BODY, null));

        Test.startTest();
        DirectumContractRequestBody body = new DirectumContractRequestBody();
        DirectumWebService data = new DirectumWebService();
        HttpResponse result = data.sendPostRequest(URL, JSON.serialize(body));
        Test.stopTest();

        String actualValue = result.getBody();

        System.assertNotEquals(null, actualValue);
        System.assertEquals(200, result.getStatusCode());
        System.assertEquals(actualValue, RESPONSE_BODY);
    }

    @IsTest
    public static void createContractNegativeTest() {

        Test.setMock(HttpCalloutMock.class, new SingleRequestMock(400, 'Complete', RESPONSE_BODY, null));

        Test.startTest();
        DirectumContractRequestBody body = new DirectumContractRequestBody();
        DirectumWebService data = new DirectumWebService();
        data.sendPostRequest(URL, JSON.serialize(body));
        Test.stopTest();

        try {
            data.createContract(body);
        } catch (Exception e) {
            System.assert(e.getMessage().contains('Status code - 400.'));
            System.assertEquals('HttpResponseException', e.getTypeName());
        }
        System.assertEquals(null, data.sendPostRequest(null, null));
    }
}