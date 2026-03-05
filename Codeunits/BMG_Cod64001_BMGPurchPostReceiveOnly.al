codeunit 64001 "BMG Purch. Post Receive Only"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnBeforePostPurchaseDoc, '', true, true)]
    local procedure BlockInvoicePosting(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean)
    var
        AccessControl: Record "Access Control";
    begin
        if PurchaseHeader."Document Type" <> PurchaseHeader."Document Type"::Order then
            exit;

        if not PurchaseHeader.Invoice then
            exit;

        AccessControl.SetRange("User Security ID", UserSecurityId());
        AccessControl.SetRange("Role ID", 'BMGPURCHASEINVOICE');

        if AccessControl.IsEmpty() then
            Error('You are not allowed to Invoice Purchase Orders. Please contact your administrator.');

        //if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order then
        //    If PurchaseHeader.Invoice then
        //        Error('Invoice Posting is not allowed for Purchase Orders.');
    end;

    var
        myInt: Integer;
}