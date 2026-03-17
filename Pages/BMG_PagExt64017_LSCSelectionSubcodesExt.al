pageextension 64017 BMGSelectionSubcodesExt extends "LSC Selection Subcodes"
{
    layout
    {
        // Add changes to page layout here
        addafter("Serial/Lot No. Needed")
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