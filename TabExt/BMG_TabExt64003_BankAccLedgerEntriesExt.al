tableextension 64003 BMGBankAccLedgerEntriesExt extends "Bank Account Ledger Entry"
{
    AllowInCustomizations = AsReadWrite;
    fields
    {
        // Add changes to table fields here
        field(64000; "BMG Running Balance"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'BMG Running Balance';
        }
        field(64001; "BMG Running Balance (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'BMG Running Balance (LCY)';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}