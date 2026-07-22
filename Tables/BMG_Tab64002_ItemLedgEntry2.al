table 64002 BMGItemLedgEntryExt
{
    DataClassification = ToBeClassified;
    Permissions = tabledata 64002 = RIMD;

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
        field(3; "Document Type"; Enum "Item Ledger Document Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Document Type';
        }
        field(4; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(5; "Order No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(6; "Sales Invoice No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(7; "Payment Terms Code"; Code[10])
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