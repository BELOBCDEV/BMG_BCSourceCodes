codeunit 64015 BMGItemLedgEntryExtTabUpdate
{
    Permissions = tabledata 64002 = RIMD;
    trigger OnRun()
    begin
        recBMGItemLedgEntryExtTab2.Reset();
        if recBMGItemLedgEntryExtTab2.FindLast() then
            EntryNo := recBMGItemLedgEntryExtTab."Entry No."
        else
            EntryNo := 0;

        recItemLedgEntry.Reset();
        recItemLedgEntry.SetFilter("Posting Date", '%1..', 20260101D);
        recItemLedgEntry.SetRange("Document Type", recItemLedgEntry."Document Type"::"Sales Shipment");
        recItemLedgEntry.SetFilter("Entry No.", '>%1', EntryNo);

        if recItemLedgEntry.FindFirst() then
            repeat
                recBMGItemLedgEntryExtTab.Init();
                recBMGItemLedgEntryExtTab."Entry No." := recItemLedgEntry."Entry No.";
                recBMGItemLedgEntryExtTab."Posting Date" := recItemLedgEntry."Posting Date";
                recBMGItemLedgEntryExtTab."Document Type" := recItemLedgEntry."Document Type";
                recBMGItemLedgEntryExtTab."Document No." := recItemLedgEntry."Document No.";

                recSalesShipmentHeader.Reset();
                recSalesShipmentHeader.SetRange("No.", recItemLedgEntry."Document No.");

                if recSalesShipmentHeader.FindFirst() then
                    recBMGItemLedgEntryExtTab."Order No." := recSalesShipmentHeader."Order No.";

                if recBMGItemLedgEntryExtTab."Order No." <> '' then begin
                    recSalesInvoiceHeader.Reset();
                    recSalesInvoiceHeader.SetRange("Order No.", recBMGItemLedgEntryExtTab."Order No.");
                    if recSalesInvoiceHeader.findfirst() then
                        recBMGItemLedgEntryExtTab."Payment Terms Code" := recSalesInvoiceHeader."Payment Terms Code";
                end;
                if recBMGItemLedgEntryExtTab.Insert() then
                    intCtr += 1;

            until recItemLedgEntry.Next() = 0;

        if GuiAllowed then
            Message('%1 records has been inserted.');
    end;


    var
        recItemLedgEntry: Record "Item Ledger Entry";
        recBMGItemLedgEntryExtTab: Record BMGItemLedgEntryExt;
        recBMGItemLedgEntryExtTab2: Record BMGItemLedgEntryExt;
        recSalesShipmentHeader: Record "Sales Shipment Header";
        recSalesInvoiceHeader: Record "Sales Invoice Header";
        intCtr: Integer;
        EntryNo: Integer;
}