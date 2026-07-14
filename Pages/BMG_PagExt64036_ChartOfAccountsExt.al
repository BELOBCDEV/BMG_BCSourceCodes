pageextension 64036 BMGChartOfAccountsExt extends "Chart of Accounts"
{
    layout
    {
        // Add changes to page layout here
        modify("Consol. Debit Acc.")
        {
            Visible = true;
        }
        modify("Consol. Credit Acc.")
        {
            Visible = true;
        }
        modify("Consol. Translation Method")
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