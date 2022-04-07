public with sharing class AccountController {

    public List<Account> accounts { get; set; }
    public FormParams formParams { get; set; }
    private final static String ERROR = 'Error to insert Account:' ;


    public void initData() {
        this.formParams = new FormParams();
    }


    public AccountController() {
        accounts = [SELECT Id, Name, Active__c, Type, Rating FROM Account WHERE Active__c = 'Yes'];
    }

    public PageReference saveData() {
        Account acc = new Account(
                Name = formParams.Name,
                Phone = formParams.Phone,
                Rating = formParams.Rating,
                Active__c = 'Yes'
        );
        try {
            insert acc;
        } catch (Exception err) {
            throw new GlobalException(ERROR + ' ' + err.getMessage() + ' ' + err.getStackTraceString());
        }
        return null;
    }
}