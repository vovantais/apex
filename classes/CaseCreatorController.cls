public with sharing class CaseCreatorController {

    public static void createNewCases(Map<String, Object> products) {
        if (products.size() > 0) {
            List<Case> cases = new List<Case>();
            for (String key : products.keySet()) {
                cases.add(new Case(
                        Status = 'New',
                        Origin = 'Web',
                        Type = 'Electrical',
                        Subject = 'new Car',
                        Equipment__c = (Id) products.get(key)
                ));
            }
            insert cases;
        }
    }

}