codeunit 64014 BMGProcessShopifyOrdersSubs
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Order Events", OnAfterCreateSalesHeader, '', false, false)]
    local procedure OnAfterCreateSalesHeader(OrderHeader: Record "Shpfy Order Header"; var SalesHeader: Record "Sales Header")
    begin
        //Message('Shopify Order No. is %1', OrderHeader."Shopify Order No.");
        //Message('Sales Order No. is %1', SalesHeader."No.");

        if StrPos(OrderHeader."Shopify Order No.", '#') <> 0 then
            SalesHeader."External Document No." := DelChr(OrderHeader."Shopify Order No.", '=', '#')
        else
            SalesHeader."External Document No." := OrderHeader."Shopify Order No.";

        if SalesHeader."External Document No." = '' then begin
            if StrPos(SalesHeader."Shpfy Order No.", '#') <> 0 then
                SalesHeader."External Document No." := DelChr(SalesHeader."Shpfy Order No.", '=', '#')
            else
                SalesHeader."External Document No." := SalesHeader."Shpfy Order No.";
        end;
        SalesHeader.Modify();
    end;

    var
        myInt: Integer;
}