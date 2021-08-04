public with sharing class CurrencyRatesNbRb {

	public static final String API_CURS_RATES = 'https://www.nbrb.by/api/exrates/rates?periodicity=0';
	public static final String ERROR_CURS_RATES = 'Some err occupied!';

	public Httpresponse getResponse() {
		HttpResponse response = null;
		try {
         Http http = new Http();
         HttpRequest request = new HttpRequest();
         request.setEndPoint(API_CURS_RATES);
         request.setMethod('GET');
         response = http.send(request);
				if (response.getStatusCode() == 200) {
					return response.getBody();
				}
      } catch (Exception err) {
         System.debug(ERROR_CURS_RATES + err.getMessage());
      }
		return response;
   }
}