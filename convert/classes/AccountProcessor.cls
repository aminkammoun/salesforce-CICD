public class AccountProcessor {
    @future
    public static void countContacts(List<ID> listId){
        List<Account> acc = [Select Id, (select Id from Contacts) from Account Where Id IN :listId];
        for(Account a:acc){
           a.Number_Of_Contacts__c = a.Contacts.size();
            
        }
        update acc;
        
    }
}