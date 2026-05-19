pageextension 64003 ItemJournalExt extends "Item Journal"
{
    layout
    {
        // Add changes to page layout here
        modify("Unit Cost")
        {
            Visible = false;
        }
        modify("Unit Amount")
        {
            Visible = false;
        }
        modify(Amount)
        {
            Visible = false;
        }
        modify("Discount Amount")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            trigger OnBeforeValidate()
            var
                recUserSetup: Record "User Setup";
            begin
                recUserSetup.Reset();
                recUserSetup.SetRange("User ID", UserId);

                if recUserSetup.FindFirst() then begin
                    if recUserSetup."Location Filter" <> '' then begin
                        if STRPOS(recUserSetup."Location Filter", Rec."Location Code") <= 0 then
                            Error('You do not have permission to use Location Code = %1.', Rec."Location Code");
                    end;
                    if recUserSetup."Location Filter" = '' then begin
                        if recUserSetup."Location Code" <> '' then
                            if recUserSetup."Location Code" <> rec."Location Code" then
                                Error('You do not have permission to use Location Code = %1.', Rec."Location Code");
                    end;
                end;
            end;

        }
        modify("Shortcut Dimension 1 Code")
        {
            Editable = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Editable = true;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}