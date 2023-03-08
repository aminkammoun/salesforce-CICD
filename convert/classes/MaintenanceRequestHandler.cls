public with sharing class MaintenanceRequestHandler {
    public static void MaintenanceRequestHandler() {
        List<case> caseList = [SELECT id,Vehicle__c,Subject,ProductID,Product__c, (SELECT id from Equipment_Maintenance_Items__r) from case where status='closed' and Type IN ('Repair', 'Routine Maintenance') and ID IN :Trigger.new LIMIT 200];
        List<Case> casesUpdate = new List<Case>();
        Integer avgAmount=10000;
        List<Equipment_Maintenance_Item__c> newEMI = new List<Equipment_Maintenance_Item__c>();
        Map<Id, Equipment_Maintenance_Item__c> equip = new Map<Id, Equipment_Maintenance_Item__c>([Select ID, Equipment__c, Quantity__c,Equipment__r.id,Equipment__r.Maintenance_Cycle__c from Equipment_Maintenance_Item__c ]);


        for (Case cs : caseList) {
            Case c = new Case();
            c.Type= 'Routine Maintenance';
            c.Status = 'New';
            c.Date_Reported__c = Date.today();
            c.Vehicle__c = cs.Vehicle__c;
            c.Subject = String.isBlank(cs.Subject)? ' Routine Maintenance Request' : cs.Subject;
            c.ProductID = cs.ProductID;
            c.product__c = cs.Product__c;
            
            for(Equipment_Maintenance_Item__c emi: cs.Equipment_Maintenance_Items__r){
                avgAmount = Math.min(avgAmount,Integer.valueOf(equip.get(emi.id).Equipment__r.Maintenance_Cycle__c));
                newEMI.add(new Equipment_Maintenance_Item__c(
                Equipment__c = equip.get(emi.id).Equipment__c,
                Maintenance_Request__c = cs.id,
                Quantity__c = equip.get(emi.id).Quantity__c));
            }
            
            c.Date_Due__c = Date.today().addDays(avgAmount);
            c.ParentId = cs.Id;
            casesUpdate.add(c);
        }
        if (casesUpdate.size()>0) {
            insert(casesUpdate);
        }

        for (case c2 : casesUpdate) {
            for (Equipment_Maintenance_Item__c em : newEMI) {
                if (c2.ParentId == em.Maintenance_Request__c) {
                    em.Maintenance_Request__c = c2.id;
                }
            }
            
        }
        if (newEMI.size()>0) {
            insert(newEMI);
        }
    }
}