public with sharing class AccManager {

    public static List<Account> getAccount() {
        return [
          SELECT Id
          FROM Account
          WHERE Name = 'TEST'
          LIMIT 1
        ];
    }

}