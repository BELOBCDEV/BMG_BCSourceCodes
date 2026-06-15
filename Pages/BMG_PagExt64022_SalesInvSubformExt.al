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

                trigger OnValidate()
                begin
                    Rec.UpdateUnitPriceByField(42);
                end;


            }
        }
        modify("Shortcut Dimension 1 Code")
        {
            Editable = bolEditable;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Editable = bolEditable;
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
        bolEditable := not recSalesSetup."Enable User Access";
    end;

    var
        recSalesSetup: Record "Sales & Receivables Setup";
        bolEditable: Boolean;
        bolShowCustPriceColumn: Boolean;

}