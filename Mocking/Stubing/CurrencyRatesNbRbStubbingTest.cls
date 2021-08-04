@isTest
public class CurrencyRatesNbRbStubbingTest {

   @isTest
   public static void getResponse_Positive_Test() {
      CurrencyRatesNbRb data = (CurrencyRatesNbRb) Test.createStub(CurrencyRatesNbRb.class, new MockProvider());

      Test.startTest();
			HttpResponse result = data.getResponse();
			String actualValue = result.getBody();
      Test.stopTest();
      
      System.assertNotEquals(null, actualValue);
      System.assertEquals(new MockProvider().RESPONSE_BODY, actualValue);
   }
}