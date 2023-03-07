@isTest
public class TestRestrictContactByName {
    @isTest static void TestContactByName(){
        Contact cn = new Contact(FirstName='Amine',LastName='INVALIDNAME');
        Test.startTest();
        Database.SaveResult srList = Database.insert(cn, false);
       
        Test.stopTest();
        System.assert(!srList.isSuccess());
    }
    	
}