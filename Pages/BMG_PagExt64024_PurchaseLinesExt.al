pageextension 64024 BMGPurchaseLinesExt extends "Purchase Lines"
{
    layout
    {
        // Add changes to page layout here
        addafter("Document No.")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
            }
            /*
            field(BMGOrderNo; Rec."Order No.")
            {
                Caption = 'Order No.';
                ApplicationArea = All;
            }
            */
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}