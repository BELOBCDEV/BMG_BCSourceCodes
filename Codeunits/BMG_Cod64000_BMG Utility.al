codeunit 64000 "BMG Utility"
{

    trigger OnRun()
    var
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
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
        

        recJobQueueLogEntry.Reset();
        //recJobQueueLogEntry.ChangeCompany('IBSSI');

        FromDT := CreateDateTime(DMY2Date(1, 1, 2023), 000000T); // Feb 1, 2024 00:00
        ToDT := CreateDateTime(DMY2Date(31, 12, 2024), 235959T); // Feb 5, 2024 23:59

        recJobQueueLogEntry.SetRange("Start Date/Time", FromDT, ToDT);

        if recJobQueueLogEntry.FindSet() then
            recJobQueueLogEntry.DeleteAll();
        */

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

        /*
        recIntegrationSynchErrors.Reset();
        //recIntegrationSynchErrors.ChangeCompany('IBSSI');
        if recIntegrationSynchErrors.FindSet() then
            recIntegrationSynchErrors.DeleteAll();
        */

        /*
        recBankAccLedgEntryExtTable.Reset();
        if recBankAccLedgEntryExtTable.FindFirst() then
            repeat
                recBankAccLedgEntry.Reset();
                recBankAccLedgEntry.SetRange("Entry No.", recBankAccLedgEntryExtTable."Entry No.");

                if recBankAccLedgEntry.FindFirst() then begin
                    recBankAccLedgEntryExtTable."Debit Amount (LCY)" := recBankAccLedgEntry."Debit Amount (LCY)";
                    recBankAccLedgEntryExtTable."Credit Amount (LCY)" := recBankAccLedgEntry."Credit Amount (LCY)";
                    recBankAccLedgEntryExtTable."Amount (LCY)" := recBankAccLedgEntry."Amount (LCY)";
                    recBankAccLedgEntryExtTable.Description := recBankAccLedgEntry.Description;
                    recBankAccLedgEntryExtTable.Particulars := recBankAccLedgEntry.BELOParticulars;
                    recBankAccLedgEntryExtTable.Modify();
                end;
            until recBankAccLedgEntryExtTable.Next() = 0;

        Message('Bank Acc Ledger Entry Ext Table update done!');
        */

        PurchHeader.Reset();
        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Order);
        PurchHeader.SetRange("No.", 'IBPO00008087');

        if PurchHeader.FindFirst() then begin
            PurchHeader."Expected Receipt Date" := Today;
            PurchHeader."Requested Receipt Date" := Today;
            PurchHeader."Promised Receipt Date" := Today;
            PurchHeader.Modify();

            PurchLine.Reset();
            PurchLine.SetRange("Document Type", PurchLine."Document Type"::Order);
            PurchLine.SetRange("Document No.", PurchHeader."No.");

            if PurchLine.FindFirst() then
                repeat
                    PurchLine."Expected Receipt Date" := Today;
                    PurchLine."Requested Receipt Date" := Today;
                    PurchLine."Promised Receipt Date" := Today;
                    PurchLine."Planned Receipt Date" := Today;
                    PurchLine."Order Date" := Today;
                    PurchLine.Modify();
                until PurchLine.Next() = 0;
        end;

        Message('PO update done');

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
        recBankAccLedgEntryExtTable: Record BMGBankLedgEntryExt;
        recBankAccLedgEntry: Record "Bank Account Ledger Entry";



}