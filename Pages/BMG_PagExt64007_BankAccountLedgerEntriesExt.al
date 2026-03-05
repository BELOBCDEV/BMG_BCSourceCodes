pageextension 64007 BMGBankAccountLedgerEntryExt extends "Bank Account Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter(Open)
        {
            field("Bank Acc. Posting Group"; Rec."Bank Acc. Posting Group")
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