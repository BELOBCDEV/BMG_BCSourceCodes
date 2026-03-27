tableextension 64001 BMGSalesLineExt extends "Sales Line"
{
    fields
    {
        // Add changes to table fields here
        field(64000; "BMG Cust. Price Group"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'BMG Customer Price Group';
            TableRelation = "Customer Price Group";

            trigger OnValidate()
            begin
                "Customer Price Group" := "BMG Cust. Price Group";
            end;
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