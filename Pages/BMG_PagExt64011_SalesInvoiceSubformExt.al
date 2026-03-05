pageextension 64011 BMGSalesInvoiceSubformExt extends "Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        modify(Description)
        {
            Editable = bolEditable;
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    var
        recUserSetup: Record "User Setup";
    begin
        bolEditable := true;

        recUserSetup.Reset();
        recUserSetup.SetRange("User ID", UserId);

        if recUserSetup.FindFirst() then begin
            if recUserSetup.Cashier then
                bolEditable := false;
        end;
    end;

    var
        myInt: Integer;
        bolEditable: Boolean;
}