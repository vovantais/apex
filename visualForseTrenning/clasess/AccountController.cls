public with sharing class AccountController {

    public List<Account> accounts  {get; set;}
    public FormParams formParams {get; set;}


    public AccountController() {
        accounts =  [SELECT Id, Name, Active__c, Type, Rating  FROM Account WHERE Active__c = 'Yes'];
    }

    public void saveData() {

    }
}