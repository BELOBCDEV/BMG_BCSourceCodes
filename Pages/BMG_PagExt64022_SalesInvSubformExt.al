pageextension 64022 BMGSalesInvSubformExt extends "Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Qty. to Assign")
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
        modify(GetPrice)
        {
            Visible = true;
        }
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