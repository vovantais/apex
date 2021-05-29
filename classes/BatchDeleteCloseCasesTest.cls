@IsTest
private with sharing class BatchDeleteCloseCasesTest {

    @TestSetup
    private static void createTestData() {
        List<Case> cases = new List<Case>();
        for (Integer i = 0; i < 200; i++) {
            Case singleCase = new Case(
                    Status = 'Closed',
                    Expired_Date__c = Date.today() - 40,
                    Origin = 'Web'
            );
            cases.add(singleCase);
        }
        insert cases;
    }

    @IsTest
    private static void startBatchDeleteCloseCasesTest() {
        List<Case> cases = [SELECT Id,Expired_Date__c,Status,Origin FROM Case];

        System.assertEquals(200, cases.size());

        Test.startTest();
            BatchDeleteCloseCases deleteCases = new BatchDeleteCloseCases();
            Database.executeBatch(deleteCases);
        Test.stopTest();

        List<Case> removeCases = [SELECT Id,Expired_Date__c,Status,Origin FROM Case];

        System.assertEquals(0, removeCases.size());
    }
}