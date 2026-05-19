pageextension 64028 BMGLSCRetailTOSubpExt extends "LSC Retail TO. Subp."
{
    layout
    {
        // Add changes to page layout here
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
    }

    trigger OnAfterGetRecord()
    var
        recSalesSetup: Record "Sales & Receivables Setup";
    begin
        recSalesSetup.Get();
        if not recSalesSetup."Enable User Access" then
            bolEditable := true
        else
            bolEditable := false;
    end;

    var
        bolEditable: Boolean;
}