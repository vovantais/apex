public with sharing class AccountController {

    public List<Account> accounts { get; set; }
    public FormParams formParams { get; set; }
    private final static String ERROR = 'Error to insert Account:' ;

    private Integer countTotalRecords;
    private Integer OffsetSize = 0;
    private Integer QueryLimit = 10;

    public AccountController() {
        countTotalRecords = [SELECT COUNT() FROM Account];
        getAccounts();
    }

    public void getAccounts() {
        accounts = [SELECT Id, Name, Active__c, Type, Rating FROM Account WHERE Active__c = 'Yes' LIMIT :QueryLimit OFFSET :OffsetSize];
    }

    public PageReference next() {
        OffsetSize += QueryLimit;
        getAccounts();
        return null;
    }

    public PageReference previous() {
        OffsetSize -= QueryLimit;

        getAccounts();
        return null;
    }

    public Boolean getDisablePrevious() {
        if (OffsetSize > 0) {
            return false;
        } else {
            return true;
        }
    }

    public Boolean getDisableNext() {
        if (OffsetSize + QueryLimit < countTotalRecords) {
            return false;
        } else {
            return true;
        }
    }

    public void initData() {
        this.formParams = new FormParams();
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
