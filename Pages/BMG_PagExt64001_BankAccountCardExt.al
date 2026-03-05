pageextension 64001 BMGBankAccountCardExt extends "Bank Account Card"
{
    layout
    {
        // Add changes to page layout here
        modify("No.")
        {
            Visible = true;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}