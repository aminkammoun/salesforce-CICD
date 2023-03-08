public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numC,String lastName){
        List<Contact> cnt = new List<Contact>();
        for(Integer i= 0;i<numC;I++){
            cnt.add(new Contact(FirstName='Test '+i,LastName=lastName));
        }
        return cnt;
    }
}