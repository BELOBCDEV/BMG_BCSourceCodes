pageextension 64008 BMGFALedgerEntriesExt extends "FA Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("G/L Entry No.")
        {
            field("FA Posting Group"; Rec."FA Posting Group")
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