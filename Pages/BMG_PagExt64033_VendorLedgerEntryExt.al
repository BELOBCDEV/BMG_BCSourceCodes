pageextension 64033 BMGVendorLedgerEntryExt extends "Vendor Ledger Entries"
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
            field("Closed by Amount"; Rec."Closed by Amount")
            {
                ApplicationArea = All;
            }
            field("Closed by Amount (LCY)"; Rec."Closed by Amount (LCY)")
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