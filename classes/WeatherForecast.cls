public with sharing class WeatherForecast {

    private static final String ERROR = 'Some err occupied!';
    private static final List<weatherForecast__c> weatherForecastSetting = weatherForecast__c.getAll()?.values();

    public HttpResponse getWeatherForecastByCity(String city) {
        HttpResponse response = null;
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndPoint(weatherForecastSetting[0].URL__c + city + weatherForecastSetting[0].apiKey__c);
            request.setMethod('GET');
            response = http.send(request);
            if (response.getStatusCode() == 200) {
                return response;
            }
        } catch (Exception err) {
            System.debug(ERROR + err.getMessage());
        }
        return response;
    }

    public  Map<String, Object> processingResponse(String city) {
        Map<String, Object> results;
        if (String.isNotBlank(city) && city != null) {
            results = (Map<String, Object>) JSON.deserializeUntyped(getWeatherForecastByCity(city).getBody());
        }
        return results;
    }
}