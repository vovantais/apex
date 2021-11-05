public class FindContacts {
    
    private static final String ERROR_EMPTY_PARAMETERS = 'Empty parameter at method';
    
    @InvocableMethod
    public static void updateContactOwner(List<Id> contactIds) {
        List<Contact> contacts = new List<Contact>();
        
        if (contactIds.size() > 0) {
            if (getContactById(contactIds).size() > 0) {
                for (Contact singleContact : getContactById(contactIds)) {
                    singleContact.OwnerId = UserInfo.getUserId();
                    contacts.add(singleContact);
                }
            }  
            
              if (contacts.size() > 0) {
                update contacts;
            }
            
        } else {
             throw new GlobalException(ERROR_EMPTY_PARAMETERS);
        }
    }
    
    
    private static List<Contact> getContactById(List<Id> contactIds) {
        if (contactIds.size() == 0) throw new GlobalException(ERROR_EMPTY_PARAMETERS);
        
        return  [
            SELECT 
            Id,
            OwnerId
            FROM Contact
            WHERE Id =: contactIds[0]
        ];
    }
}