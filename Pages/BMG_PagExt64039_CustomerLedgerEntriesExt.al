pageextension 64039 BMGCustLedgerEntryExt extends "Customer Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("Entry No.")
        {
            field("Closed by Entry No."; Rec."Closed by Entry No.")
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