tableextension 64004 BMGMemberPointEntryExt extends "LSC Member Point Entry"
{
    fields
    {
        // Add changes to table fields here
        field(64000; "BMG Orig. Expiry Date"; Date)
        {
            DataClassification = CustomerContent;
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