@isTest
private class LeadProcessorTest {
    @isTest static void test() {
        List<Lead> leads = new List<Lead>();
        // insert 10 accounts
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(
        	LastName = 'lastName',
        	Company = 'SalesForce'));
        }
        insert leads;
        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca,200);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        List<Lead> updatedLeads = [SELECT ID,LeadSource from Lead where LeadSource='DreamForce'];
        System.assertEquals(200, updatedLeads.size(), 'ERROR: Atleast 1 Account record wth incorrect');
    }
}