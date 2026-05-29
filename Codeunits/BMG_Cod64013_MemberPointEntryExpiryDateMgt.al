codeunit 64013 BMGMemberPointEntryExpDateMgt
{
    Permissions = tabledata "LSC Member Point Entry" = RM;
    trigger OnRun()
    var
        recSalesSetup: Record "Sales & Receivables Setup";
    begin
        recSalesSetup.Get();
        if not recSalesSetup."Enable Member Expiration" then begin
            recMemberPointEntry.Reset();
            recMemberPointEntry.SetFilter("Expiration Date", '<>%1', 0D);

            intRecCtr := 0;

            if recMemberPointEntry.FindSet() then
                repeat
                    intRecCtr += 1;
                    recMemberPointEntry."BMG Orig. Expiry Date" := recMemberPointEntry."Expiration Date";
                    recMemberPointEntry."Expiration Date" := 0D;
                    recMemberPointEntry.Modify();
                until recMemberPointEntry.Next() = 0;
        end else begin
            recMemberPointEntry.Reset();
            recMemberPointEntry.SetFilter("BMG Orig. Expiry Date", '<>%1', 0D);

            if recMemberPointEntry.FindFirst() then
                repeat
                    intRecCtr := 0;
                    recMemberPointEntry."Expiration Date" := recMemberPointEntry."BMG Orig. Expiry Date";
                    recMemberPointEntry.Modify();
                until recMemberPointEntry.Next() = 0;
        end;

        if GuiAllowed then
            Message('%1 records modified.', intRecCtr);
    end;

    var
        recMemberPointEntry: Record "LSC Member Point Entry";
        intRecCtr: Integer;
}