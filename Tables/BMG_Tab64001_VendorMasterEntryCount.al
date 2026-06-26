table 64001 BMGVendorMasterEntryCount
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Vendor Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Entry Count"; Integer)
        {
            Caption = 'Vend. Ledger Entry Count';
            DataClassification = CustomerContent;
        }
        field(4; "Purch. Order Count"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(5; "Purch. Invoice Count"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(6; "Vendor Exist"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Vendor No.")
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