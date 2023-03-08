@isTest
private class AccountTriggerTest {
    @isTest static void TestCreate200records() {
        // Test Setup data
        // Create 200 new Accounts
        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Account ' + i, BillingState= 'CA');
            accts.add(acct);
        }              
        // Perform Test
        Test.startTest();
        insert accts;                               
        Test.stopTest();
        // Verify that 200 new Accounts were inserted
        List<Account> verifyAccts = [SELECT ShippingState FROM Account where BillingState = 'CA'];
         
        for(Account a:verifyAccts){
            System.assertEquals('CA', a.ShippingState,'ERROR');   
        }
                                    
    }
}