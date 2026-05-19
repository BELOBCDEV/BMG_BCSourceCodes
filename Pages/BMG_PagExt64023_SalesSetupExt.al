pageextension 64023 BMGSalesSetupExt extends "Sales & Receivables Setup"
{
    layout
    {

        // Add changes to page layout here
        addlast(General)
        {
            field("Show Cust. Price Grp. in SO/SI"; Rec."Show Cust. Price Grp. in SO/SI")
            {
                ApplicationArea = All;
                Visible = true;
            }
            field("Enable User Access"; Rec."Enable User Access")
            {
                ApplicationArea = All;
                Visible = true;
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