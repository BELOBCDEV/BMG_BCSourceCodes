codeunit 64008 BMGTransferOrderMgt
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Header", OnBeforeValidateTransferFromCode, '', false, false)]
    local procedure "Transfer Header_OnBeforeValidateTransferFromCode"(var TransferHeader: Record "Transfer Header"; var xTransferHeader: Record "Transfer Header"; var IsHandled: Boolean; var HideValidationDialog: Boolean)
    begin
        recUserSetup.Reset();
        recUserSetup.SetRange("User ID", UserId);

        if recUserSetup.FindFirst() then begin
            if recUserSetup."Location Code" <> '' then
                if TransferHeader."Transfer-from Code" <> recUserSetup."Location Code" then
                    Error(NotAllowedLocationLbl, TransferHeader."Transfer-from Code");
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WMS Management", OnBeforeCheckItemJnlLineLocation, '', false, false)]
    local procedure "WMS Management_OnBeforeCheckItemJnlLineLocation"(var ItemJournalLine: Record "Item Journal Line"; var xItemJournalLine: Record "Item Journal Line"; var IsHandled: Boolean)
    begin
        recUserSetup.Reset();
        recUserSetup.SetRange("User ID", UserId);

        if recUserSetup.FindFirst() then begin
            if recUserSetup."Location Code" <> '' then begin
                if ItemJournalLine."Location Code" <> recUserSetup."Location Code" then
                    Error(NotAllowedLocationLbl, ItemJournalLine."Location Code");
            end;
        end;
    end;

    var
        recUserSetup: Record "User Setup";
        NotAllowedLocationLbl: Label '%1 is not allowed to be used.', Comment = '%1 = Location Code';
}