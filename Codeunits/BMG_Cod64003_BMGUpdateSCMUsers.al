codeunit 64003 BMGUpdateSCMUsers
{
    trigger OnRun()
    begin

        recUserSetup.Reset();
        recUserSetup.ChangeCompany('IBSSI');
        recUserSetup.SetRange(SCM, true);
        recUserSetup.SetRange("Allow Backdating", false);

        if recUserSetup.FindFirst() then
            repeat
                recUserSetup."Allow Posting From" := Today;
                recUserSetup.Modify();
            until recUserSetup.Next() = 0;


        recUserSetup.ChangeCompany('LSSI');
        recUserSetup.Reset();
        recUserSetup.SetRange(SCM, true);
        recUserSetup.SetRange("Allow Backdating", false);

        if recUserSetup.FindFirst() then
            repeat
                recUserSetup."Allow Posting From" := Today;
                recUserSetup.Modify();
            until recUserSetup.Next() = 0;

        recUserSetup.ChangeCompany('SASHI');
        recUserSetup.Reset();
        recUserSetup.SetRange(SCM, true);
        recUserSetup.SetRange("Allow Backdating", false);

        if recUserSetup.FindFirst() then
            repeat
                recUserSetup."Allow Posting From" := Today;
                recUserSetup.Modify();
            until recUserSetup.Next() = 0;

        recUserSetup.ChangeCompany('ZAPPP, INC');
        recUserSetup.Reset();
        recUserSetup.SetRange(SCM, true);
        recUserSetup.SetRange("Allow Backdating", false);

        if recUserSetup.FindFirst() then
            repeat
                recUserSetup."Allow Posting From" := Today;
                recUserSetup.Modify();
            until recUserSetup.Next() = 0;

        recUserSetup.ChangeCompany('CENTRAL');
        recUserSetup.Reset();
        recUserSetup.SetRange(SCM, true);
        recUserSetup.SetRange("Allow Backdating", false);

        if recUserSetup.FindFirst() then
            repeat
                recUserSetup."Allow Posting From" := Today;
                recUserSetup.Modify();
            until recUserSetup.Next() = 0;
    end;

    var
        myInt: Integer;
        recUserSetup: Record "User Setup";
}