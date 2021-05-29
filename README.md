1. Make trigger when opportunity create fields are marked automatically if is empty(Type - New Customer,
Description - 'new possibility of processing within an hour' , Next Step - 'make a client',
recordType - 'USA opportunity', LeadSource - 'Web', 
Delivery/Installation Status - 'In progress'
);
2. Create Batch that delete all Cases if Expired_Date__c <= LAST_MONTH;