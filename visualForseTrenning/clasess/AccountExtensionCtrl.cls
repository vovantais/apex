public with sharing class AccountExtensionCtrl {

    public String nameQuery { get; set; }
    public List<Account> accounts { get; set; }
    public List<Account> cloneAccounts { get; set; }

    private ApexPages.StandardSetController setController;

    public AccountExtensionCtrl(ApexPages.StandardSetController setController) {
        this.setController = setController;
        accounts = [SELECT Id, Name, Active__c, Type, Rating FROM Account WHERE Active__c = 'Yes'];
        cloneAccounts = accounts;
        setController.setSelected(accounts);
    }

    public PageReference executeSearch() {
        List<Account> filteredAcc = new List<Account>();
        if (String.isNotEmpty(nameQuery) && nameQuery != null) {
            for (Account acc : accounts) {
                if (acc.Name.contains(nameQuery)) {
                    filteredAcc.add(acc);
                }
            }
        }
        if (filteredAcc.size() > 0) {
            accounts = filteredAcc;
        } else {
            accounts = cloneAccounts;
        }
        return null;
    }
}