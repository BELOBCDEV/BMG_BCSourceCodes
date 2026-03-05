
pageextension 64005 BMGMemberDepositExt extends "LSC ACT Member Deposit List"
{
    layout
    {
        // Add changes to page layout here
        addafter(Balance)
        {
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
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
