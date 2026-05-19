pageextension 64030 BMGTransferOrderExt extends "Transfer Order"
{
    layout
    {
        // Add changes to page layout here
        modify("Shortcut Dimension 1 Code")
        {
            Editable = bolEditable;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Editable = bolEditable2;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    begin
        recSalesSetup.Get();

        If recSalesSetup."Enable User Access" then begin
            if ((Rec."Transfer-from Code" = 'WHSE') OR (CopyStr(Rec."Transfer-from Code", 1, 2) = 'WH')) and
              (Rec.Status <> Rec.Status::Released) then
                bolEditable := true
            else
                bolEditable := false;

            if Rec.Status = Rec.Status::Released then
                bolEditable2 := false;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        recSalesSetup.Get();

        If recSalesSetup."Enable User Access" then begin
            if ((Rec."Transfer-from Code" = 'WHSE') OR (CopyStr(Rec."Transfer-from Code", 1, 2) = 'WH')) and
              (Rec.Status <> Rec.Status::Released) then
                bolEditable := true
            else
                bolEditable := false;

            if Rec.Status = Rec.Status::Released then
                bolEditable2 := false;
        end;
    end;

    var
        myInt: Integer;
        recUserSetup: Record "User Setup";
        recSalesSetup: Record "Sales & Receivables Setup";
        bolEditable: Boolean;
        bolEditable2: Boolean;
}