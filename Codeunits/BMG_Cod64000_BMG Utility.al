codeunit 64000 "BMG Utility"
{

    Permissions = tabledata 32 = RIMD,
                  tabledata "Vendor Ledger Entry" = RIMD,
                  tabledata "Detailed Vendor Ledg. Entry" = RIMD,
                  tabledata "Bank Account Ledger Entry" = RIMD,
                  tabledata "VAT Entry" = RIMD,
                  tabledata "Value Entry" = RIMD,
                  tabledata WHT_Entry_PHL = RIMD,
                  tabledata "Purch. Inv. Header" = RIMD,
                  tabledata "Purch. Inv. Line" = RIMD,
                  tabledata "G/L Entry" = RIMD,
                  tabledata "Transfer Shipment Header" = RIMD,
                  tabledata "Inventory Period" = RIMD;
    trigger OnRun()
    var
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        GLEntry: Record "G/L Entry";
        VendorLedgEntry: Record "Vendor Ledger Entry";
        DtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry";
        BankAccLedgEntry: Record "Bank Account Ledger Entry";
        VATEntry: Record "VAT Entry";
        ValueEntry: Record "Value Entry";
        WHTEntry: Record WHT_Entry_PHL;
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchInvLine: Record "Purch. Inv. Line";
        ItemLedgEntry: Record "Item Ledger Entry";
        VendorCode: Code[20];
        NewVendorCode: Code[20];
        intCtr: array[10] of Integer;
        PostingDate: Date;
        SalesPrice: Record "Sales Price";
        MemberPointEntry: Record "LSC Member Point Entry";
        MPEntryNo: Integer;
        MPCounter: Integer;
        LSCStatement: Record "LSC Statement";
        ItemCategory: Record "Item Category";
        LSCTransSalesEntry: Record "LSC Trans. Sales Entry";
        LSCTransStatus: Record "LSC Transaction Status";
        TransferShipmentHeader: Record "Transfer Shipment Header";
        TransferShipmentLine: Record "Transfer Shipment Line";
        PostedWhseShipmentHeader: Record "Posted Whse. Shipment Header";
        PostedWhseShipmentLine: Record "Posted Whse. Shipment Line";
        InventoryPeriod: Record "Inventory Period";
        LSCPOSTerminal: Record "LSC POS Terminal";
        LSCPOSTerminal2: Record "LSC POS Terminal";
        PostedStatement: Record "LSC Posted Statement";
        PostedStatementLine: Record "LSC Posted Statement Line";
        intRecCtr: Integer;
        recVendor: Record Vendor;
    begin
        //07292026
        ValueEntry.Reset();
        ValueEntry.SetRange("Posting Date", 20261004D);

        if ValueEntry.FindFirst() then
            repeat
                ValueEntry."Posting Date" := 20260410D;
                ValueEntry."Document Date" := 20260410D;
                ValueEntry."VAT Reporting Date" := 20260410D;
                ValueEntry."Valuation Date" := 20260410D;
                ValueEntry."LSC Posting Date" := 20260410D;
                ValueEntry.Modify();
                intCtr[1] += 1;
            until ValueEntry.Next() = 0;

        ValueEntry.Reset();
        ValueEntry.SetRange("Posting Date", 20270508D);

        if ValueEntry.FindFirst() then
            repeat
                ValueEntry."Posting Date" := 20260508D;
                ValueEntry."Document Date" := 20260508D;
                ValueEntry."VAT Reporting Date" := 20260508D;
                ValueEntry."Valuation Date" := 20260508D;
                ValueEntry."LSC Posting Date" := 20260508D;
                ValueEntry.Modify();
                intCtr[2] += 1;
            until ValueEntry.Next() = 0;

        ItemLedgEntry.Reset();
        ItemLedgEntry.SetRange("Posting Date", 20261004D);

        if ItemLedgEntry.FindFirst() then
            repeat
                ItemLedgEntry."Posting Date" := 20260410D;
                ItemLedgEntry."Document Date" := 20260410D;
                ItemLedgEntry."Last Invoice Date" := 20260410D;
                ItemLedgEntry.Modify();
                intCtr[3] += 1;
            until ItemLedgEntry.Next() = 0;

        ItemLedgEntry.Reset();
        ItemLedgEntry.SetRange("Posting Date", 20270508D);

        if ItemLedgEntry.FindFirst() then
            repeat
                ItemLedgEntry."Posting Date" := 20260508D;
                ItemLedgEntry."Document Date" := 20260508D;
                ItemLedgEntry."Last Invoice Date" := 20260508D;
                ItemLedgEntry.Modify();
                intCtr[4] += 1;
            until ItemLedgEntry.Next() = 0;

        Message('%1 VEntry Apr updated\%2 Ventry May updated\%3 ILE Apr updated\%4 ILE May updated', intCtr[1], intCtr[2], intCtr[3], intCtr[4]);

        //07132026
        /*
        recApprovalUserSetup.Reset();
        recApprovalUserSetup.SetFilter("User ID", '%1', 'VINCENT.ALCANTARA');

        if recApprovalUserSetup.FindFirst() then
            repeat
                recApprovalUserSetup."Approval Administrator" := true;
                recApprovalUserSetup.Modify();
                intRecCtr += 1;
            until recApprovalUserSetup.Next() = 0;

        Message('%1 record updated successfully!', intRecCtr);
        */
        /*
        recVendor.Reset();
        recVendor.SetRange("No.", 'NT000163');
        intRecCtr := 0;
        if recVendor.FindFirst() then begin
            recVendor."IC Partner Code" := 'SASHI';
            recVendor.Modify();
            intRecCtr += 1;
        end;
        
        Message('%1 record updated successfully.', intRecCtr);
        */

        /*
        PostedStatementLine.Reset();
        PostedStatementLine.SetFilter("Statement No.", '%1|%2', 'SB160000000001', 'SB160000000002');

        if PostedStatementLine.FindFirst() then
            repeat
                PostedStatementLine.Delete();
                intRecCtr += 1;
            until PostedStatementLine.Next() = 0;
        Message('%1 records deleted in Posted Statement Line', intRecCtr);
        */

        /*
        //07102026
        PostedStatement.Reset();
        PostedStatement.SetRange("Store No.", 'B016');
        intRecCtr := 0;
        if PostedStatement.FindFirst() then
            repeat
                PostedStatement.Delete();
                intRecCtr += 1;
            until PostedStatement.Next() = 0;
        Message('%1 records deleted in Posted Statement', intRecCtr);

        LSCPOSTerminal.ChangeCompany('CENTRAL');
        LSCPOSTerminal.Reset();
        LSCPOSTerminal.SetFilter("No.", '%1|%2', 'B016A', 'B016B');
        MPCounter := 0;
        if LSCPOSTerminal.FindFirst() then
            repeat
                LSCPOSTerminal2.Init();
                LSCPOSTerminal2.TransferFields(LSCPOSTerminal);
                LSCPOSTerminal2.Insert();
                MPCounter += 1;
            until LSCPOSTerminal.Next() = 0;

        Message('%1 records transferred.', MPCounter);
        */

        //07.03.2026
        /*
        GLEntry.Reset();
        GLEntry.SetRange("Posting Date", 20270226D);

        clear(intCtr);

        if GLEntry.FindFirst() then
            repeat
                GLEntry."Posting Date" := 20260226D;
                GLEntry.Modify();
                intCtr[1] += 1;
            until GLEntry.Next() = 0;

        ValueEntry.Reset();
        ValueEntry.SetRange("Posting Date", 20270226D);

        if ValueEntry.FindFirst() then
            repeat
                ValueEntry."Posting Date" := 20260226D;
                ValueEntry.Modify();
                intCtr[2] += 1;
            until ValueEntry.Next() = 0;

        ItemLedgEntry.Reset();
        ItemLedgEntry.SetRange("Posting Date", 20270226D);

        if ItemLedgEntry.FindFirst() then
            repeat
                ItemLedgEntry."Posting Date" := 20260226D;
                ItemLedgEntry.Modify();
                intCtr[3] += 1;
            until ItemLedgEntry.Next() = 0;

        Message('%1 GLEntry records modified\%2 Value Entry records modified\%3 ILE records modified.', intCtr[1], intCtr[2], intCtr[3]);
        */

        /*
        InventoryPeriod.Reset();
        InventoryPeriod.SetRange("Ending Date", 20260430D);

        if InventoryPeriod.FindFirst() then begin
            InventoryPeriod.Closed := true;
            InventoryPeriod.Modify();
        end;
        */

        /*
        TransferShipmentHeader.Reset();
        TransferShipmentHeader.SetFilter("No.", '%1|%2', 'ITS00000001', 'ITS00000002');
        
        if TransferShipmentHeader.FindFirst() then repeat
            TransferShipmentHeader."Transfer Order Date" := 20260501D;
            TransferShipmentHeader."Posting Date" := 20260501D;
            TransferShipmentHeader."Shipment Date" := 20260501D;
            TransferShipmentHeader."Receipt Date" := 20260501D;
            TransferShipmentHeader.Modify();
        until TransferShipmentHeader.Next() = 0;
        Message('Transfer Shipment Header update');
        TransferShipmentLine.Reset();
        TransferShipmentLine.SetFilter("Document No.", '%1|%2', 'ITS00000001', 'ITS00000002');

        if TransferShipmentLine.findfirst() then repeat
           TransferShipmentLine."Shipment Date" := 20260501D;
           TransferShipmentLine.Modify();
        until TransferShipmentLine.Next() = 0;
        Message('Transfer Shipment Lines update');
        */

        //07.02.2026
        /*
        ItemLedgEntry.Reset();
        ItemLedgEntry.SetRange("Entry No.", 104118);

        if ItemLedgEntry.FindFirst() then begin
            ItemLedgEntry."Lot No." := 'MEC061626';
            ItemLedgEntry."Expiration Date" := 20261231D;
            ItemLedgEntry.Modify();
            Message('ILE update done.');
        end;
        */


        //06282026
        /*
        recApprovalUserSetup.Reset();
        recApprovalUserSetup.SetFilter("User ID", '%1|%2|%3|%4', 'JSALVADOR', 'KAREN.BALTAZAR', 'VINCENT.ALCANTARA', 'FA');

        if recApprovalUserSetup.FindFirst() then
            repeat
                recApprovalUserSetup."Approval Administrator" := true;
                recApprovalUserSetup.Modify();
            until recApprovalUserSetup.Next() = 0;

        Message('Approval User Setup update done!');
        */
        //06222026
        /*
        LSCTransSalesEntry.Reset();
        LSCTransSalesEntry.SetRange(Date, 20260621D);
        LSCTransSalesEntry.SetRange("Store No.", 'B013');
        LSCTransSalesEntry.SetRange("Item No.", '005-1104-0003829');

        if LSCTransSalesEntry.FindFirst() then
            repeat
                //first update
                LSCTransSalesEntry."Lot No." := 'N-0226-A5002';
                LSCTransSalesEntry.Modify();

            until LSCTransSalesEntry.Next() = 0;
        Message('Update Done.');

        LSCTransSalesEntry.Reset();
        LSCTransSalesEntry.SetRange(Date, 20260621D);
        LSCTransSalesEntry.SetRange("Store No.", 'B013');
        LSCTransSalesEntry.SetRange("Item No.", '005-2304-0000434');

        if LSCTransSalesEntry.FindFirst() then
            repeat
                //2nd update
                LSCTransSalesEntry."Lot No." := 'N-Q1025-5710013';
                LSCTransSalesEntry.Modify();

            until LSCTransSalesEntry.Next() = 0;
        */

        //Item Hierarchy
        /*
        ItemCategory.Reset();
        ItemCategory.SetFilter(Code, '%1|%2|%3|%4|%5|%6',
        'FORSALE', 'SVC:PHYSICIAN', 'SVC:AESTHETICIAN',
        'SVC:SRG_V', 'SVC:OTHERS', 'SVC:SURGICAL');

        if ItemCategory.FindFirst() then
            repeat
                case ItemCategory.Code of
                    'FORSALE':
                        ItemCategory."LSC Division Code" := 'PRODUCT';
                    'SVC:PHYSICIAN':
                        ItemCategory."LSC Division Code" := 'MD';
                    'SVC:AESTHETICIAN':
                        ItemCategory."LSC Division Code" := 'AES';
                    'SVC:SRG_V':
                        ItemCategory."LSC Division Code" := 'SUR-V';
                    'SVC:OTHERS':
                        ItemCategory."LSC Division Code" := 'SUR-OTH';
                    'SVC:SURGICAL':
                        ItemCategory."LSC Division Code" := 'SUR-VMG';
                end;
                ItemCategory.Modify();
            until ItemCategory.Next() = 0;
        */

        //06182026
        /*
        LSCStatement.Reset();
        LSCStatement.SetRange("No.", 'SB140000000249');

        if LSCStatement.FindFirst() then
            LSCStatement.Delete();

        Message('Done');
        */
        /*
        //06122026
        MemberPointEntry.Reset();
        MemberPointEntry.SetRange("Entry Type", MemberPointEntry."Entry Type"::Expire);

        Message('Record count is %1', MemberPointEntry.Count);

        MemberPointEntry.Reset();
        MemberPointEntry.SetRange("Account No.", '0000D7FC3');
        MemberPointEntry.SetRange("Entry Type", MemberPointEntry."Entry Type"::Expire);

        if MemberPointEntry.FindFirst() then
            MemberPointEntry.Delete();
        */
        //0005-001-178
        /*
        MemberPointEntry.Reset();
        MemberPointEntry.SetRange("Account No.", '0005-001-178');
        MemberPointEntry.SetRange("Entry Type", MemberPointEntry."Entry Type"::Expire);

        if MemberPointEntry.FindFirst() then begin
            MPEntryNo := MemberPointEntry."Entry No.";
            MemberPointEntry.Delete();
        end;

        MemberPointEntry.Reset();
        MemberPointEntry.SetRange("Account No.", '0005-001-178');
        MemberPointEntry.SetFilter("Entry Type", '<>%1', MemberPointEntry."Entry Type"::Expire);
        MemberPointEntry.SetRange("Closed by Entry", MPEntryNo);

        MPCounter := 0;

        if MemberPointEntry.FindFirst() then
            repeat
                MemberPointEntry."Closed by Points" := 0;
                MemberPointEntry."Closed by Entry" := 0;
                MemberPointEntry.Modify();
                MPCounter += 1;
            until MemberPointEntry.Next() = 0;

        Message('%1 records updated', MPCounter);
        */

        /*
        SalesPrice.Reset();
        SalesPrice.SetRange("Sales Code", 'PDS');

        if SalesPrice.FindSet() then
            SalesPrice.DeleteAll();

        Message('Sales Price Deletion Done!');
        */


        /*
        //wrong use of posting date - raised by DJ
        PostingDate := 20260728D;

        ItemLedgEntry.Reset();
        ItemLedgEntry.SetRange("Posting Date", PostingDate);

        intCtr[1] := 0;
        if ItemLedgEntry.FindFirst() then
            repeat
                ItemLedgEntry."Posting Date" := 20260528D;
                ItemLedgEntry.Modify();
                intCtr[1] += 1;
            until ItemLedgEntry.Next() = 0;

        ValueEntry.Reset();
        ValueEntry.SetRange("Posting Date", PostingDate);

        intCtr[2] := 0;
        if ValueEntry.FindFirst() then
            repeat
                ValueEntry."Posting Date" := 20260528D;
                ValueEntry.Modify();
                intCtr[2] += 1;
            until ValueEntry.Next() = 0;

        GLEntry.Reset();
        GLEntry.SetRange("Posting Date", PostingDate);

        intCtr[3] := 0;

        if GLEntry.FindFirst() then
            repeat
                GLEntry."Posting Date" := 20260528D;
                GLEntry.Modify();
                intCtr[3] += 1;
            until GLEntry.Next() = 0;

        Message('Modified record count is: ILE %1\Value Entry', intCtr[1], intCtr[2], intCtr[3]);
        */

        /* //for Vendor merging
        VendorCode := 'TR000273';
        NewVendorCode := 'TR000148';

        GLEntry.Reset();
        GLEntry.SetRange("Bal. Account Type", GLEntry."Bal. Account Type"::Vendor);
        GLEntry.SetRange("Bal. Account No.", VendorCode);

        if GLEntry.FindSet() then
            repeat
                GLEntry."Bal. Account No." := NewVendorCode;
                GLEntry.Modify();
                intCtr[1] += 1;
            until GLEntry.Next() = 0;

        VendorLedgEntry.Reset();
        VendorLedgEntry.SetRange("Vendor No.", VendorCode);
        if VendorLedgEntry.FindSet() then
            repeat
                VendorLedgEntry."Vendor No." := NewVendorCode;
                VendorLedgEntry.Modify();
                intCtr[2] += 1;
            //VendorLedgEntry.ModifyAll("Vendor No.", NewVendorCode);
            until VendorLedgEntry.Next() = 0;

        DtldVendLedgEntry.Reset();
        DtldVendLedgEntry.SetRange("Vendor No.", VendorCode);

        if DtldVendLedgEntry.FindSet() then
            repeat
                DtldVendLedgEntry."Vendor No." := NewVendorCode;
                DtldVendLedgEntry.Modify();
                intCtr[3] += 1;
            until DtldVendLedgEntry.Next() = 0;

        BankAccLedgEntry.Reset();
        BankAccLedgEntry.SetRange("Bal. Account Type", BankAccLedgEntry."Bal. Account Type"::Vendor);
        BankAccLedgEntry.SetRange("Bal. Account No.", VendorCode);

        if BankAccLedgEntry.FindSet() then
            repeat
                BankAccLedgEntry."Bal. Account No." := NewVendorCode;
                BankAccLedgEntry.Modify();
                intCtr[4] += 1;
            until BankAccLedgEntry.Next() = 0;

        VATEntry.Reset();
        VATEntry.SetRange("Bill-to/Pay-to No.", VendorCode);

        if VATEntry.FindSet() then
            repeat
                VATEntry."Bill-to/Pay-to No." := NewVendorCode;
                VATEntry.Modify();
                intCtr[5] += 1;
            until VATEntry.Next() = 0;

        ValueEntry.Reset();
        ValueEntry.SetRange("Source Type", ValueEntry."Source Type"::Vendor);
        ValueEntry.SetRange("Source No.", VendorCode);

        if ValueEntry.FindSet() then
            repeat
                ValueEntry."Source No." := NewVendorCode;
                ValueEntry.Modify();
                intCtr[6] += 1;
            until ValueEntry.Next() = 0;

        WHTEntry.Reset();
        WHTEntry.SetRange("Bill-to/Pay-to No.", VendorCode);
        if WHTEntry.FindSet() then
            repeat
                WHTEntry."Bill-to/Pay-to No." := NewVendorCode;
                WHTEntry.Modify();
                intCtr[7] += 1;
            until WHTEntry.Next() = 0;

        PurchInvHeader.Reset();
        PurchInvHeader.SetRange("Buy-from Vendor No.", VendorCode);
        if PurchInvHeader.FindSet() then
            repeat
                PurchInvHeader."Buy-from Vendor No." := NewVendorCode;
                PurchInvHeader."Pay-to Vendor No." := NewVendorCode;
                PurchInvHeader.Modify();
                intCtr[8] += 1;
            until PurchInvHeader.Next() = 0;


        PurchInvLine.Reset();
        PurchInvLine.SetRange("Buy-from Vendor No.", VendorCode);
        if PurchInvLine.FindSet() then
            repeat
                PurchInvLine."Buy-from Vendor No." := NewVendorCode;
                PurchInvLine."Pay-to Vendor No." := NewVendorCode;
                PurchInvLine.Modify();
                intCtr[9] += 1;
            until PurchInvLine.Next() = 0;

        Message('GL Entry: %1 modified records\' +
                'Vend Ledger Entry: %2 modified records\' +
                'Dtld Vend Ledg Entry: %3 modified records\' +
                'Bank Ledg Entry: %4 modified records\' +
                'VAT Entry: %5 modified records\' +
                'Value Entry: %6 modified records\' +
                'WHT Entry: %7 modified records\' +
                'Purch Inv Header: %8 modified records\' +
                'Purch Inv Line: %9 modified records.',
                intCtr[1], intCtr[2], intCtr[3], intCtr[4],
                intCtr[5], intCtr[6], intCtr[7], intCtr[8], intCtr[9]);
        */




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
        /*
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
        */

        /*
        recItemLedgEntry.Reset();
        recItemLedgEntry.SetRange("Entry No.", 5904);
        if recItemLedgEntry.FindFirst() then begin
            recItemLedgEntry."Lot No." := 'IBSSI-4537E-GWP';
            recItemLedgEntry.Modify()
        end;
        Message('ILE update done');
        */

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
        recItemLedgEntry: Record "Item Ledger Entry";


}