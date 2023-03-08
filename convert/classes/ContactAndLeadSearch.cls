public class ContactAndLeadSearch {
    
    public static List<List< sObject>> searchContactsAndLeads(String str){
        List<List< sObject>> searchList = [FIND :str IN ALL FIELDS
                    RETURNING Lead(FirstName),Contact(FirstName,LastName)];
        
        return searchList;
    }
}