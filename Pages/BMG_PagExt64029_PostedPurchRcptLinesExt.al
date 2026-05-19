pageextension 64029 BMGPostedPurchRcptLinesExt extends "Posted Purchase Receipt Lines"
{
    layout
    {
        // Add changes to page layout here
        addafter("Document No.")
        {
            field("Posting Date"; Rec."Posting Date")
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