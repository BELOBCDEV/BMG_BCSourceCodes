codeunit 64011 BMGSendEmailIfJQFails
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::"Job Queue Log Entry", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifyJobQueueLogEntry(var Rec: Record "Job Queue Log Entry"; var xRec: Record "Job Queue Log Entry"; RunTrigger: Boolean)
    begin
        if Rec.Status <> Rec.Status::Error then
            exit;
        if xRec.Status = xRec.Status::Error then
            exit;

        if (Rec."Object Caption to Run" = 'Adjust Cost - Item Entries') OR
           (Rec."Object Caption to Run" = 'BMGPostBulkOpenStatement') then
            SendFailureEmail(Rec);

    end;

    local procedure SendFailureEmail(JobQueueLogEntry: Record "Job Queue Log Entry")
    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        UserSetup: Record "User Setup";
        Recipients: List of [Text];
    begin
        UserSetup.Reset();
        //UserSetup.SetRange("Approval Administrator", true);
        UserSetup.SetFilter("User ID", '%1|%2|%3', 'RMARQUEZ', 'JSALVADOR', 'FA');

        if UserSetup.FindSet() then
            repeat
                if UserSetup."E-Mail" <> '' then
                    Recipients.Add(UserSetup."E-Mail");
            until UserSetup.Next() = 0;

        if Recipients.Count = 0 then
            exit;

        EmailMessage.Create(
            Recipients,
            StrSubstNo('Job Queue Failed: %1', JobQueueLogEntry.Description),
            BuildEmailBody(JobQueueLogEntry),
            true);

        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    local procedure BuildEmailBody(JobQueueLogEntry: Record "Job Queue Log Entry"): Text
    var
        Body: TextBuilder;
    begin
        Body.Append('<p>A Job Queue entry has encountered an error.</p>');
        Body.Append(StrSubstNo('<p><b>Description:</b> %1</p>', JobQueueLogEntry.Description));
        Body.Append(StrSubstNo('<p><b>Object Type:</b> %1</p>', Format(JobQueueLogEntry."Object Type to Run")));
        Body.Append(StrSubstNo('<p><b>Object ID:</b> %1</p>', JobQueueLogEntry."Object ID to Run"));
        Body.Append(StrSubstNo('<p><b>Start Date/Time:</b> %1</p>', Format(JobQueueLogEntry."Start Date/Time")));
        Body.Append(StrSubstNo('<p><b>Error:</b> %1</p>', JobQueueLogEntry."Error Message"));
        Body.Append('<p>Please review the Job Queue Log in Business Central for more details.</p>');
        exit(Body.ToText());
    end;
}
