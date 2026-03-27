codeunit 64007 BMGPopulateCustPriceGroup
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterUpdateAmounts, '', false, false)]
    local procedure "Sales Line_OnAfterUpdateAmounts"(var SalesLine: Record "Sales Line"; var xSalesLine: Record "Sales Line"; CurrentFieldNo: Integer)
    begin
        if SalesLine."Document Type" in [SalesLine."Document Type"::Order, SalesLine."Document Type"::Invoice] then
            SalesLine."BMG Cust. Price Group" := SalesLine."Customer Price Group";
    end;


    var
        myInt: Integer;
}