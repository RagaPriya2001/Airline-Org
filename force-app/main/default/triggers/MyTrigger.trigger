trigger MyTrigger on Airline__c (before delete) {
    Map<ID,Airline__c> air=[select Id,(select Airline_Name__c from Boarding_Details__c)from Airline__c where Id =trigger.old();]
    if(air.size()>0){
        for(Airline__c a: air){
            trigger.oldMap.get(a.Id).addError('Unable to delete related Airline to Boarding Details');
        }
    }

}