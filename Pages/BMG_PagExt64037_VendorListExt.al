pageextension 64037 BMGVendorListExt extends "Vendor List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Payments (LCY)")
        {
            field(SystemCreatedAt; Rec.SystemCreatedAt)
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