@RestResource(UrlMapping='/CreateCases/')
global with sharing class ReactRestController {
    private static final String ERROR_MESSAGE = 'Error to insert case';

    @HttpPost
    global static void createNewCasesByProductIds() {
        String jsonStr = RestContext.request.requestBody.toString();
        Map<String, Object> products = (Map<String, Object>) JSON.deserializeUntyped(jsonStr);

        try {
            CaseCreatorController.createNewCases(products);

        } catch (Exception err) {
            System.debug('Error in ReactRestController' + err.getMessage() + ' ' + err.getStackTraceString());

            throw new GlobalException(ERROR_MESSAGE);
        }
    }

}