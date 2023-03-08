@isTest
public class AccountProcessorTest {
	@isTest
    private static void countContactsTest(){
        List<Account> accounts = new List<Account>();
        for(Integer i=0;i<300 ; i++){
            accounts.add(new Account(Name= 'acc '+ i));
        }
        insert  accounts;
        List<Contact> contacts = new List<Contact>();
        List<Id> accountIds = new List<Id>();
        for(Account acc : accounts){
            contacts.add(new Contact(FirstName= acc.Name,LastName= 'TestContact',AccountId= acc.Id));
            accountIds.add(acc.Id);
        }
        insert contacts;
        
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        //check the results
        List<Account> accs =[Select Id, Number_Of_Contacts__c from Account];
        
        for(Account acc:accs){
            System.assertEquals(1, acc.Number_Of_Contacts__c,'ERROR: Atleast 1 Account record wth incorrect');
        }
            
    }
   
}