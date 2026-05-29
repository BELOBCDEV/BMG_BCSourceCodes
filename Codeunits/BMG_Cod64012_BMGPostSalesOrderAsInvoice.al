codeunit 64012 BMGPostShippedSalesOrder
{
    trigger OnRun()
    begin
        PostShippedSalesOrders();
    end;

    procedure PostShippedSalesOrders()
    var
        SalesHeader: Record "Sales Header";
        SalesPost: Codeunit "Sales-Post";
        ErrorMsg: Text;
        Posted: Integer;
        Skipped: Integer;
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);

        if not SalesHeader.FindSet() then begin
            Message('No released Sales Orders found.');
            exit;
        end;

        repeat
            if HasPostedShipment(SalesHeader) then begin
                SalesHeader.Ship := false;
                SalesHeader.Invoice := true;
                if SalesPost.Run(SalesHeader) then
                    Posted += 1
                else begin
                    ErrorMsg := GetLastErrorText();
                    Skipped += 1;
                    ClearLastError();
                end;
            end;
        until SalesHeader.Next() = 0;

        //Message('Done.\\ Posted: %1\\ Skipped (errors): %2', Posted, Skipped);
    end;

    local procedure HasPostedShipment(SalesHeader: Record "Sales Header"): Boolean
    var
        SalesShipmentLine: Record "Sales Shipment Line";
    begin
        SalesShipmentLine.SetRange("Order No.", SalesHeader."No.");
        SalesShipmentLine.SetFilter("Qty. Shipped Not Invoiced", '>0');
        exit(not SalesShipmentLine.IsEmpty());
    end;
}
