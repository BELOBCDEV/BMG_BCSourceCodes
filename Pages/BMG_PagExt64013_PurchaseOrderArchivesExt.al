pageextension 64013 BMGPurchaseOrderArchive extends "Purchase Order Archives"
{
    layout
    {
        // Add changes to page layout here
        addafter("Archived By")
        {
            /*
            field("Pay-to Address"; Rec."Pay-to Address")
            {
                ApplicationArea = All;
                Caption = 'Address';
            }
            field("Pay-to Address 2"; Rec."Pay-to Address 2")
            {
                ApplicationArea = All;
                Caption = 'Address 2';
            }
            */
            field("Order Date"; Rec."Order Date")
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