trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    List<Opportunity> opps = [select Id, StageName from Opportunity where StageName = 'Closed Won'];
    List <Task> taskToAdd = new List<Task>();
    for(Opportunity opp :opps ){
	Task task = new Task(Subject='Follow Up Test Task',WhatId= opp.Id);
        taskToAdd.add(task);
    }
    insert taskToAdd;
}