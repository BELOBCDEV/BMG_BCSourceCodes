pageextension 64012 BMGMemberAccountExt extends APIClinicMemberAccount
{
    layout
    {
        // Add changes to page layout here
        addafter(Privacy_Blocked)
        {
            field("No. Series"; Rec."No. Series")
            {
                Visible = false;
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