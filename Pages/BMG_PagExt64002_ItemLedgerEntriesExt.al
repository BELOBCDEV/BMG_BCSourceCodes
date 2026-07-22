pageextension 64002 ItemLedgerEntriesExt extends "Item Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addbefore("Unit of Measure Code")
        {
            field(BaseUOM; codBaseUOM)
            {
                Caption = 'Base Unit of Measure';
                ApplicationArea = All;
            }
        }
        addafter("Unit of Measure Code")
        {
            field(PurchUOM; codPurchUOM)
            {
                Caption = 'Purch. Unit of Measure';
                ApplicationArea = All;
            }
        }
        addafter("Entry No.")
        {
            field(SalesInvoiceNo; codInvoiceNo)
            {
                ApplicationArea = All;
                Caption = 'Sales Invoice No.';
            }
            field(PaymentTermsCode; codPaymentTerm)
            {
                ApplicationArea = All;
                Caption = 'Payment Terms Code';
            }
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                ApplicationArea = All;
            }

        }

    }

    trigger OnAfterGetRecord()
    begin
        recItem.Reset();
        recItem.SetRange("No.", Rec."Item No.");

        codBaseUOM := '';

        if recItem.FindFirst() then begin
            codBaseUOM := recItem."Base Unit of Measure";
            codPurchUOM := recItem."Purch. Unit of Measure";
        end;

        if Rec."Document Type" = Rec."Document Type"::"Sales Shipment" then begin

            recPostedSalesShip.Reset();
            recPostedSalesShip.SetRange("No.", Rec."Document No.");
            codPaymentTerm := '';
            codInvoiceNo := '';
            if recPostedSalesShip.FindFirst() then begin
                if recPostedSalesShip."Order No." <> '' then begin
                    recPostedSalesInv.Reset();
                    recPostedSalesInv.SetRange("Order No.", recPostedSalesShip."Order No.");

                    if recPostedSalesInv.FindFirst() then begin
                        codInvoiceNo := recPostedSalesInv."No.";
                        codPaymentTerm := recPostedSalesInv."Payment Terms Code";
                    end;
                end;
            end;
        end;
    end;

    var
        recPostedSalesInv: Record "Sales Invoice Header";
        recPostedSalesShip: Record "Sales Shipment Header";
        codBaseUOM: Code[10];
        codPurchUOM: Code[10];
        recItem: Record Item;
        codPaymentTerm: Code[10];
        codInvoiceNo: Code[20];

}