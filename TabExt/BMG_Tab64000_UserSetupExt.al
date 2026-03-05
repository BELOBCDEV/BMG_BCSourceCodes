tableextension 64000 BMGUserSetupExt extends "User Setup"
{
    fields
    {
        // Add changes to table fields here
        field(64000; SCM; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(64001; "Allow Backdating"; Boolean)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "Allow Backdating" then
                    "Allow Posting From" := 0D
                else
                    "Allow Posting From" := Today;

            end;
        }

        field(64002; Cashier; Boolean)
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