public with sharing class AccountServiceLightning {

    @AuraEnabled
    public static Id getAccountId() {
        return AccManager.getAccount()[0].Id != null ? AccManager.getAccount()[0].Id : null;
    }
}