pageextension 64016 BMGRetailCardExt extends "LSC Retail Item"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("Automatic Ext. Texts")
        {
            field("WHT Product Posting Group PHL"; Rec."WHT Product Posting Group PHL")
            {
                ApplicationArea = All;
                Caption = 'WHT Prod. Posting Group';
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