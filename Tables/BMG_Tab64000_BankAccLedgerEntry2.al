table 64050 BMGBankLedgEntryExt
{
    DataClassification = CustomerContent;
    Permissions = tabledata 64050 = RIMD;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Bank Account No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Running Balance"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(5; "Running Balance (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(6; "Debit Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(7; "Credit Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(8; Amount; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(9; "Debit Amount (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(10; "Credit Amount (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(11; "Amount (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(12; Description; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(13; Particulars; Text[100])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}