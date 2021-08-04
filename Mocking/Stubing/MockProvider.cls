@isTest
public class MockProvider implements System.StubProvider {
   public static final Integer RESPONSE_CODE = 200;
   public static final String RESPONSE_HEADER_KEY = 'Content-Type';
   public static final String RESPONSE_HEADER_VALUE = 'application/json;charset=UTF-8';
   public final String RESPONSE_BODY = '[{"Cur_ID": 170,"Date": "2021-01-11T00:00:00","Cur_Abbreviation": "AUD","Cur_Scale": 1,"Cur_Name": "Австралийский доллар","Cur_OfficialRate": 2.0029}]';

   public Object handleMethodCall(Object stubbedObject, String stubbedMethodName, 
      Type returnType, List<Type> listOfParamTypes, List<String> listOfParamNames, 
                                    List<Object> listOfArgs) {
      HttpResponse res = new HttpResponse();
      res.setHeader(RESPONSE_HEADER_KEY, RESPONSE_HEADER_VALUE);
      res.setBody(RESPONSE_BODY);
      res.setStatusCode(RESPONSE_CODE);
      return res;
	}
}