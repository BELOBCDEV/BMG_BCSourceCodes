codeunit 64008 BMGTransferOrderMgt
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Header", OnBeforeValidateTransferFromCode, '', false, false)]
    local procedure "Transfer Header_OnBeforeValidateTransferFromCode"(var TransferHeader: Record "Transfer Header"; var xTransferHeader: Record "Transfer Header"; var IsHandled: Boolean; var HideValidationDialog: Boolean)
    begin
        recSalesSetup.Get();
        if recSalesSetup."Enable User Access" then begin
            recUserSetup.Reset();
            recUserSetup.SetRange("User ID", UserId);

            if recUserSetup.FindFirst() then begin
                if recUserSetup."Location Filter" <> '' then begin
                    if STRPOS(recUserSetup."Location Filter", TransferHeader."Transfer-from Code") < 0 then
                        Error(NotAllowedLocationLbl, TransferHeader."Transfer-from Code");
                end;
                if recUserSetup."Location Filter" = '' then begin
                    if recUserSetup."Location Code" <> '' then
                        if recUserSetup."Location Code" <> TransferHeader."Transfer-from Code" then
                            Error(NotAllowedLocationLbl, TransferHeader."Transfer-from Code");
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WMS Management", OnBeforeCheckItemJnlLineLocation, '', false, false)]
    local procedure "WMS Management_OnBeforeCheckItemJnlLineLocation"(var ItemJournalLine: Record "Item Journal Line"; var xItemJournalLine: Record "Item Journal Line"; var IsHandled: Boolean)
    begin
        recSalesSetup.Get();
        if recSalesSetup."Enable User Access" then begin
            recUserSetup.Reset();
            recUserSetup.SetRange("User ID", UserId);

            if recUserSetup.FindFirst() then begin
                if recUserSetup."Location Filter" <> '' then begin
                    if STRPOS(recUserSetup."Location Filter", ItemJournalLine."Location Code") < 0 then
                        Error(NotAllowedLocationLbl, ItemJournalLine."Location Code");
                end;
                if recUserSetup."Location Filter" = '' then begin
                    if recUserSetup."Location Code" <> '' then
                        if recUserSetup."Location Code" <> ItemJournalLine."Location Code" then
                            Error(NotAllowedLocationLbl, ItemJournalLine."Location Code");
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnValidateLocationCodeOnBeforeSetShipmentDate, '', false, false)]
    local procedure "Sales Line_OnValidateLocationCodeOnBeforeSetShipmentDate"(var SalesLine: Record "Sales Line"; var IsHandled: Boolean)
    var
        recUserSetup: Record "User Setup";
    begin
        recSalesSetup.Get();
        if recSalesSetup."Enable User Access" then begin
            recUserSetup.Reset();
            recUserSetup.SetRange("User ID", UserId);
            if recUserSetup.FindFirst() then begin
                if recUserSetup."Location Filter" <> '' then begin
                    if SalesLine."Location Code" <> '' then begin
                        if StrPos(recUserSetup."Location Filter", SalesLine."Location Code") <= 0 then
                            Error('You do not have permission to use Location Code = %1', SalesLine."Location Code");
                    end;
                end;
                if recUserSetup."Location Filter" = '' then begin
                    if recUserSetup."Location Code" <> '' then begin
                        if recUserSetup."Location Code" <> SalesLine."Location Code" then
                            Error('You do not have permission to use Location Code = %1', SalesLine."Location Code");
                    end;
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeReleaseSalesDoc, '', false, false)]
    local procedure "Sales-Post_OnBeforeReleaseSalesDoc"(var SalesHeader: Record "Sales Header")
    var
        recSalesLine: Record "Sales Line";
        recItem: Record Item;
    begin
        recSalesSetup.Get();
        if recSalesSetup."Enable User Access" then begin
            recSalesLine.Reset();
            recSalesLine.SetFilter("Document Type", '%1|%2', recSalesLine."Document Type"::Order, recSalesLine."Document Type"::Invoice);
            recSalesLine.SetRange("Document No.", SalesHeader."No.");
            recSalesLine.SetFilter("No.", '<>%1', '');
            recSalesLine.SetRange("Location Code", '');

            if recSalesLine.FindFirst() then
                repeat
                    if recSalesLine.Type = recSalesLine.Type::Item then begin
                        if recItem.Get(recSalesLine."No.") then
                            if recItem.Type = recItem.Type::Inventory then
                                Error('Location Code is required for Line No. = %1.', recSalesLine."Line No.");
                        if recSalesLine."Shortcut Dimension 1 Code" = '' then
                            Error('Branches Code must not be blank.');
                        if recSalesLine."Shortcut Dimension 2 Code" = '' then
                            Error('Department Code must not be blank.');
                    end;
                    if (recSalesLine.Type = recSalesLine.Type::"G/L Account") OR (recSalesLine.Type = recSalesLine.Type::"Fixed Asset") then begin
                        if recSalesLine."Shortcut Dimension 1 Code" = '' then
                            Error('Branches Code must not be blank.');
                        if recSalesLine."Shortcut Dimension 2 Code" = '' then
                            Error('Department Code must not be blank.');
                    end;
                until recSalesLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", OnBeforeReleasePurchaseDoc, '', false, false)]
    local procedure "Release Purchase Document_OnBeforeReleasePurchaseDoc"(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var SkipCheckReleaseRestrictions: Boolean; var IsHandled: Boolean; SkipWhseRequestOperations: Boolean)
    var
        recPurchLine: Record "Purchase Line";
        recItem: Record Item;
    begin
        recSalesSetup.Get();
        if recSalesSetup."Enable User Access" then begin
            recPurchLine.Reset();
            recPurchLine.SetRange("Document Type", recPurchLine."Document Type"::Order);
            recPurchLine.SetRange("Document No.", PurchaseHeader."No.");
            recPurchLine.SetRange(Type, recPurchLine.Type::Item);

            if recPurchLine.FindFirst() then
                repeat
                    if recPurchLine.Type = recPurchLine.Type::Item then begin
                        if recItem.Get(recPurchLine."No.") then begin
                            if recItem.Type = recItem.Type::Inventory then begin
                                if recPurchLine."Location Code" = '' then
                                    Error('Location Code is required for Line No. = %1.', recPurchLine."Line No.");
                            end;
                            if recPurchLine."Shortcut Dimension 1 Code" = '' then
                                Error('Branch Code is required for Line No. = %1.', recPurchLine."Line No.");
                            if recPurchLine."Shortcut Dimension 2 Code" = '' then
                                Error('Department Code is required for Line No. = %1.', recPurchLine."Line No.");
                        end;
                    end;
                    if (recPurchLine.Type = recPurchLine.Type::"G/L Account") OR (recPurchLine.Type = recPurchLine.Type::"Fixed Asset") then begin
                        if recPurchLine."Shortcut Dimension 1 Code" = '' then
                            Error('Branch Code is required for Line No. = %1.', recPurchLine."Line No.");
                        if recPurchLine."Shortcut Dimension 2 Code" = '' then
                            Error('Department Code is required for Line No. = %1.', recPurchLine."Line No.");
                    end;
                until recPurchLine.Next() = 0;
        end;
    end;

    /*
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnBeforePostItemJnlLine, '', false, false)]
    local procedure "Item Jnl.-Post Line_OnBeforePostItemJnlLine"(var ItemJournalLine: Record "Item Journal Line"; CalledFromAdjustment: Boolean; CalledFromInvtPutawayPick: Boolean; var ItemRegister: Record "Item Register"; var ItemLedgEntryNo: Integer; var ValueEntryNo: Integer; var ItemApplnEntryNo: Integer)
    begin
        if ItemJournalLine."Shortcut Dimension 2 Code" = '' then
            Error('Department code must not be blank.');
    end;
    */

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnBeforeCheckGenJnlLine, '', false, false)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeCheckGenJnlLine"(GenJnlLine: Record "Gen. Journal Line"; CheckLine: Boolean; var OverrideDimErr: Boolean; var IsHandled: Boolean)
    var
        recDefaultDim: Record "Default Dimension";
        recSalesSetup: Record "Sales & Receivables Setup";
    begin
        recSalesSetup.Get();
        if recSalesSetup."Enable User Access" then begin
            //---Chart of account---
            if GenJnlLine."Account Type" = GenJnlLine."Account Type"::"G/L Account" then begin
                recDefaultDim.Reset();
                recDefaultDim.SetRange("Table ID", 15);
                recDefaultDim.SetRange("No.", GenJnlLine."Account No.");
                recDefaultDim.SetRange("Dimension Code", 'BRANCHES');

                if recDefaultDim.FindFirst() then
                    if recDefaultDim."Value Posting" = recDefaultDim."Value Posting"::"Code Mandatory" then
                        if GenJnlLine."Shortcut Dimension 1 Code" = '' then
                            Error('Branch Code must not be blank!');

                recDefaultDim.Reset();
                recDefaultDim.SetRange("Table ID", 15);
                recDefaultDim.SetRange("No.", GenJnlLine."Account No.");
                recDefaultDim.SetRange("Dimension Code", 'DEPT');

                if recDefaultDim.FindFirst() then
                    if recDefaultDim."Value Posting" = recDefaultDim."Value Posting"::"Code Mandatory" then
                        if GenJnlLine."Shortcut Dimension 2 Code" = '' then
                            Error('Department Code must not be blank!');
            end;
        end;
    end;

    var
        recUserSetup: Record "User Setup";
        recSalesSetup: Record "Sales & Receivables Setup";
        NotAllowedLocationLbl: Label 'You do not have permission to use Location Code = %1.', Comment = '%1 = Location Code';
}