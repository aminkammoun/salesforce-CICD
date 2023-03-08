public class ContactSearch {
    public static List<Contact> searchForContacts(String frst, String scnd){             
    	return [Select ID,Name  from Contact where (LastName =: frst AND MailingPostalCode =: scnd )];
    }
}