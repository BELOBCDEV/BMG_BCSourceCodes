page 64101 BMGBankAccLedgerEntries2Ext
{
    ApplicationArea = All;
    Caption = 'BMG Bank Acc Ledger Entry 2';
    CardPageID = BMGBankAccLedgerEntries2Ext;
    Editable = false;
    PageType = List;
    SourceTable = BMGBankLedgEntryExt;
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bank account no.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the posting date.';
                }
                field("Running Balance"; Rec."Running Balance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the running balance.';
                }
                field("Running Balance (LCY)"; Rec."Running Balance (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the running balance.';
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Debit Amount.';
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Credit Amount.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Amount.';
                }
                field("Debit Amount (LCY)"; Rec."Debit Amount (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Debit Amount (LCY).';
                }
                field("Credit Amount (LCY)"; Rec."Credit Amount (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Credit Amount (LCY).';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Amount (LCY).';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Description.';
                }
                field(Particulars; Rec.Particulars)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Particulars.';
                }
            }
        }
    }
}
