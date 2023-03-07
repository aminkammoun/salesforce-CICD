public with sharing class Ocupeclass {
    public ocupeclass() {
        return [SELECT Id, Name, Active__c FROM Account WHERE Active__c = 'Yes' WITH SECURITY_ENFORCED];
    }
}