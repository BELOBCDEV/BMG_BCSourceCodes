pageextension 64502 BMGTransSalesEntries extends "LSC Transaction Sales Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("Receipt No.")
        {
            field("POS Line Description"; Rec."POS Line Description")
            {
                Caption = 'Journal Description';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}