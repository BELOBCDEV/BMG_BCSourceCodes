pageextension 64009 BMSValueEntriesExt extends "Value Entries"
{
    layout
    {
        // Add changes to page layout here
        addbefore("Item Ledger Entry No.")
        {
            field("Inventory Posting Group"; Rec."Inventory Posting Group")
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