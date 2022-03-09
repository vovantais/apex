({
    createAccount: function (component) {
        const createRecordEvent = $A.get('e.force:createRecord');
        if (createRecordEvent) {
            createRecordEvent.setParams({
                'entityApiName': 'Account',
                'defaultFieldValues': {
                    'Name': 'test create Account',
                    'Type': 'Prospect',
                    'Industry': 'Apparel',
                    'Rating': 'Hot'
                }
            });
            createRecordEvent.fire();
            alert('Create successfully!');
        } else {
            throw new Error('Cant create Account')
        }
    }
});