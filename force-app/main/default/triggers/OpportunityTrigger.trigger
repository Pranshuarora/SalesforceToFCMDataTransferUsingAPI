trigger OpportunityTrigger on Opportunity (after update) {
    for (Opportunity opp : Trigger.new) {
        Opportunity oldOpp = Trigger.oldMap.get(opp.Id);
        if (opp.StageName == 'Closed Won' && oldOpp.StageName != 'Closed Won') {
            FCMNotification.sendNotification(
                'dFRHPxIfQrm_Rg5Iawse81:APA91bF6-HU8K2Afow7WH_qze-TrfNeH9EyFbqxvKUNsUzcOlpIVuTyiYlb1tvCnVrwHd_7gBS6cx9zOhfW4W4E3Day-txrPxvhIwfBMylZUXTauHQcZyaTI4HvwBI6XfYHTWfv3-ij4',
                'Opportunity Closed Won',
                'An opportunity has been closed as won.',
                opp.StageName,
                opp.Id,
                opp.Name
            );
        }
    }
}
