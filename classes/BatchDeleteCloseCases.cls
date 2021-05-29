public with sharing class BatchDeleteCloseCases implements Database.Batchable<SObject> {

    private final String QUERY;
    private final String STATUS_CLOSED;

    public BatchDeleteCloseCases() {
        try {
            STATUS_CLOSED = 'Closed';
            QUERY = 'SELECT Status, ' +
                    'Expired_Date__c ' +
                    'FROM Case ' +
                    'WHERE Status = :STATUS_CLOSED ' +
                    'AND Expired_Date__c <= LAST_MONTH';
        } catch (Exception e) {
            System.debug('e.getMessage() ===>' + e.getMessage());
            System.debug('e.getStackTraceString() ===>' + e.getStackTraceString());
        }
    }

    public Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator(QUERY);
    }

    public void execute(Database.BatchableContext context, List<Case> closedCases) {
        try {
            List<Case> removeCases = new List<Case>();
            if (!closedCases.isEmpty()) {
                for (Case closedCase : closedCases) {
                    if (closedCase.Status == STATUS_CLOSED) {
                        removeCases.add(closedCase);
                    }
                }
            }
            if (!removeCases.isEmpty()) {
                delete removeCases;
            }
        } catch (Exception e) {
            System.debug('e.getMessage() ===>' + e.getMessage());
            System.debug('e.getStackTraceString() ===>' + e.getStackTraceString());
        }
    }

    public void finish(Database.BatchableContext context) { }
}