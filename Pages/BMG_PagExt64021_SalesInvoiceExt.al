pageextension 64021 BMGSalesInvoiceExt extends "Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
        addafter(Status)
        {
            field("Customer Price Group"; Rec."Customer Price Group")
            {
                ApplicationArea = All;
                Visible = bolShowCustPriceColumn;

                trigger OnValidate()
                var
                    myInt: Integer;
                    recSalesLine: Record "Sales Line";
                begin
                    recSalesLine.Reset();
                    recSalesLine.SetRange("Document Type", Rec."Document Type");
                    recSalesLine.SetRange("Document No.", Rec."No.");

                    if recSalesLine.FindSet() then begin
                        recSalesLine.ModifyAll("BMG Cust. Price Group", Rec."Customer Price Group");
                        recSalesLine.ModifyAll("Customer Price Group", Rec."Customer Price Group");
                    end;

                end;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    begin
        recSalesSetup.Get();
        bolShowCustPriceColumn := recSalesSetup."Show Cust. Price Grp. in SO/SI";
    end;

    var
        recSalesSetup: Record "Sales & Receivables Setup";
        bolShowCustPriceColumn: Boolean;
}