codeunit 64006 BMGReopenPO_EventSubs
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", OnBeforeManualReopenPurchaseDoc, '', false, false)]
    local procedure "Release Purchase Document_OnBeforeManualReopenPurchaseDoc"(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean)
    var
        AccessControl: Record "Access Control";
    begin
        if PurchaseHeader."Document Type" <> PurchaseHeader."Document Type"::Order then
            exit;
        if PurchaseHeader.Status <> PurchaseHeader.Status::Released then
            exit;

        AccessControl.SetRange("User Security ID", UserSecurityId());
        AccessControl.SetRange("Role ID", 'BMGREOPENPURCHORDER');

        if AccessControl.IsEmpty() then
            Error('You are not allowed to reopen Purchase Order. Please contact your administrator.');
    end;



    var
        myInt: Integer;
}