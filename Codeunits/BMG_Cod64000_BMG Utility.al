codeunit 64000 "BMG Utility"
{

    trigger OnRun()
    begin
        //DONE
        /*
        recItem.Reset();
        recItem.SetRange("No.", 'OTH00122');

        if recItem.FindFirst() then begin
            recItem."Base Unit of Measure" := 'PIECES';
            recItem."Sales Unit of Measure" := 'PIECES';
            recItem."Purch. Unit of Measure" := 'PIECES';
            recItem.Modify();

            message('Done!');
        end;
        */

        /*
        recApprovalUserSetup.Reset();
        recApprovalUserSetup.SetFilter("User ID", '%1|%2|%3|%4', 'JSALVADOR', 'KAREN.BALTAZAR', 'VINCENT.ALCANTARA', 'FA');

        if recApprovalUserSetup.FindFirst() then
            repeat
                recApprovalUserSetup."Approval Administrator" := true;
                recApprovalUserSetup.Modify();
            until recApprovalUserSetup.Next() = 0;

        
        recUser.Reset();
        recUser.SetRange("User Name", 'CHENG.OLAYVAR');

        if recUser.FindFirst() then
            recUser.Delete();
        */
        //recTenantMedia.DeleteAll();
        /*
        recLSCPreaction.Reset();
        recLSCPreaction.ChangeCompany('CENTRAL');
        if recLSCPreaction.FindSet() then
            recLSCPreaction.DeleteAll();
        */

        recJobQueueLogEntry.Reset();
        //recJobQueueLogEntry.ChangeCompany('IBSSI');

        FromDT := CreateDateTime(DMY2Date(1, 1, 2023), 000000T); // Feb 1, 2024 00:00
        ToDT := CreateDateTime(DMY2Date(31, 12, 2024), 235959T); // Feb 5, 2024 23:59

        recJobQueueLogEntry.SetRange("Start Date/Time", FromDT, ToDT);

        if recJobQueueLogEntry.FindSet() then
            recJobQueueLogEntry.DeleteAll();


        /*
        recSentNotificationEntry.Reset();
        recSentNotificationEntry.ChangeCompany('IBSSI');
        if recSentNotificationEntry.FindSet() then
            recSentNotificationEntry.DeleteAll();
        */

        /*
        recIntegrationSynchJob.Reset();
        recIntegrationSynchJob.ChangeCompany('IBSSI');
        if recIntegrationSynchJob.FindSet() then
            recIntegrationSynchJob.DeleteAll();
        */

        recIntegrationSynchErrors.Reset();
        //recIntegrationSynchErrors.ChangeCompany('IBSSI');
        if recIntegrationSynchErrors.FindSet() then
            recIntegrationSynchErrors.DeleteAll();

        Message('Done!');
    end;

    var
        myInt: Integer;
        FromDT: DateTime;
        ToDT: DateTime;
        recItem: Record Item;
        recApprovalUserSetup: Record "User Setup";
        recUser: Record User;
        recTenantMedia: Record "Tenant Media";
        recLSCPreaction: Record "LSC Preaction";
        recJobQueueLogEntry: Record "Job Queue Log Entry";
        recSentNotificationEntry: Record "Sent Notification Entry";
        recIntegrationSynchJob: Record "Integration Synch. Job";
        recIntegrationSynchErrors: Record "Integration Synch. Job Errors";



}