pageextension 64027 BMGRetailTransferOrderExt extends "LSC Retail Transfer Order"
{
    layout
    {
        // Add changes to page layout here
        modify("Transfer-from Code")
        {
            trigger OnBeforeValidate()
            var
                recUserSetup: Record "User Setup";
                recSalesSetup: Record "Sales & Receivables Setup";
            begin
                recSalesSetup.Get();
                if recSalesSetup."Enable User Access" then begin
                    recUserSetup.Reset();
                    recUserSetup.SetRange("User ID", UserId);

                    if recUserSetup.FindFirst() then begin
                        if recUserSetup."Location Filter" <> '' then begin
                            if STRPOS(recUserSetup."Location Filter", Rec."Transfer-from Code") < 0 then
                                Error('You do not have permission to use Location Code = %1.', Rec."Transfer-from Code");
                        end;
                        if recUserSetup."Location Filter" = '' then begin
                            if recUserSetup."Location Code" <> '' then
                                if recUserSetup."Location Code" <> rec."Transfer-from Code" then
                                    Error('You do not have permission to use Location Code = %1.', Rec."Transfer-from Code");
                        end;
                    end;
                end;
            end;


        }
        modify("Store-from")
        {
            trigger OnBeforeValidate()
            var
                recUserSetup: Record "User Setup";
                recSalesSetup: Record "Sales & Receivables Setup";
            begin
                recSalesSetup.Get();
                if recSalesSetup."Enable User Access" then begin
                    recUserSetup.Reset();
                    recUserSetup.SetRange("User ID", UserId);

                    if recUserSetup.FindFirst() then begin
                        if recUserSetup."Location Code" <> '' then
                            if recUserSetup."Location Code" <> Rec."LSC Store-from" then
                                Error('You do not have permission to location code=%1.', Rec."LSC Store-from");
                    end;
                end;
            end;

        }
        modify("Shortcut Dimension 1 Code")
        {
            Editable = bolEditable;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Editable = bolEditable;
        }
    }



    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    var
        recSalesSetup: Record "Sales & Receivables Setup";
    begin
        recSalesSetup.Get();
        if not recSalesSetup."Enable User Access" then
            bolEditable := true
        else
            bolEditable := false;

    end;

    var
        myInt: Integer;
        bolEditable: Boolean;
}