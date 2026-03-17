pageextension 64018 BMGActivityProdCardExt extends "LSC Activity Product Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("Participant List")
        {
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
            }
            field(SystemCreatedBy; Rec.SystemCreatedBy)
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