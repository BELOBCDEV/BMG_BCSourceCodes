pageextension 64000 "BMG Transfer Lines Ext" extends "Transfer Lines"
{
    layout
    {
        // Add changes to page layout here
        addafter("Document No.")
        {
            field("Transfer-from Code"; Rec."Transfer-from Code")
            {
                ApplicationArea = All;
            }
            field("Transfer-to Code"; Rec."Transfer-to Code")
            {
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