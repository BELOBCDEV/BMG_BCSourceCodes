pageextension 64010 BMGUserSetupExt extends "User Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Purchase Resp. Ctr. Filter")
        {
            field(SCM; Rec.SCM)
            {
                ApplicationArea = All;
            }
            field("Allow Backdating"; Rec."Allow Backdating")
            {
                ApplicationArea = All;
            }

            field(Cashier; Rec.Cashier)
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