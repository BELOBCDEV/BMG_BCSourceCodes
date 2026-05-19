codeunit 64010 BMGCleanupIntSynchErrors
{
    trigger OnRun()
    var
        recIntegrationSynchErrors: Record "Integration Synch. Job Errors";
    begin
        recIntegrationSynchErrors.Reset();
        if recIntegrationSynchErrors.FindSet() then
            recIntegrationSynchErrors.DeleteAll();
    end;

    var
        myInt: Integer;
}

