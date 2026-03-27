pageextension 64020 BMGSalesOrderSubformExt extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Shipment Date")
        {
            field("BMG Cust. Price Group"; Rec."BMG Cust. Price Group")
            {
                Caption = 'Customer Price Group';
                ApplicationArea = All;
                Visible = bolShowCustPriceColumn;
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