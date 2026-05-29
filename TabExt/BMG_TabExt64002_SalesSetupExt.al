tableextension 64002 BMGSalesSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(64000; "Show Cust. Price Grp. in SO/SI"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(64001; "Enable User Access"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Enable Location User Access';
        }
        field(64002; "Enable Member Expiration"; Boolean)
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