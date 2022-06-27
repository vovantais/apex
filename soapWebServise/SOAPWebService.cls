global class SOAPWebService {

    Webservice static Id makeContact(String contactLastName) {
        Id contId;
        if (contactLastName != null ) {
            Contact cont = new Contact(
                    LastName = contactLastName
            );
            insert cont;
            contId = cont.Id;
            return contId;
        }
        return contId;
    }
}