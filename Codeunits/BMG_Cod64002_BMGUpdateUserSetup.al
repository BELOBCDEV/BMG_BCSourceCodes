codeunit 64002 BMGUpdateUserSetup
{
    trigger OnRun()
    begin
        recUserSetup.Reset();
        recUserSetup.ChangeCompany('IBSSI');
        recUserSetup.SetRange("User ID", 'TREASURY.AS3');

        if recUserSetup.FindFirst() then begin
            recUserSetup."Allow Posting From" := Today;
            recUserSetup.Modify();
        end;


        recUserSetup.ChangeCompany('LSSI');
        recUserSetup.Reset();
        recUserSetup.SetRange("User ID", 'TREASURY.AS3');

        if recUserSetup.FindFirst() then begin
            recUserSetup."Allow Posting From" := Today;
            recUserSetup.Modify();
        end;

        recUserSetup.ChangeCompany('SASHI');
        recUserSetup.Reset();
        recUserSetup.SetRange("User ID", 'TREASURY.AS3');

        if recUserSetup.FindFirst() then begin
            recUserSetup."Allow Posting From" := Today;
            recUserSetup.Modify();
        end;

        recUserSetup.ChangeCompany('ZAPPP, INC');
        recUserSetup.Reset();
        recUserSetup.SetRange("User ID", 'TREASURY.AS3');

        if recUserSetup.FindFirst() then begin
            recUserSetup."Allow Posting From" := Today;
            recUserSetup.Modify();
        end;
    end;

    var
        myInt: Integer;
        recUserSetup: Record "User Setup";
}