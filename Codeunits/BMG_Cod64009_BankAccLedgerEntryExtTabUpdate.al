codeunit 64009 BMGBankAccLedgEntryUpdate
{
    trigger OnRun()
    var
        CalcRunningAccBalance: Codeunit "Calc. Running Acc. Balance";
        recBankLedgEntryExt: Record BMGBankLedgEntryExt;
        recBankLedgEntryExt2: Record BMGBankLedgEntryExt;
        recBankLedgEntry: Record "Bank Account Ledger Entry";
        intLastEntryNo: Integer;
    begin

        recBankLedgEntryExt.Reset();
        if recBankLedgEntryExt.FindLast() then
            intLastEntryNo := recBankLedgEntry."Entry No.";

        recBankLedgEntry.Reset();
        recBankLedgEntry.SetFilter("Entry No.", '>%1', intLastEntryNo);

        if recBankLedgEntry.FindSet() then
            repeat
                myInt += 1;
                recBankLedgEntryExt2.Init();
                recBankLedgEntryExt2."Entry No." := recBankLedgEntry."Entry No.";
                recBankLedgEntryExt2."Bank Account No." := recBankLedgEntry."Bank Account No.";
                recBankLedgEntryExt2."Posting Date" := recBankLedgEntry."Posting Date";
                Clear(CalcRunningAccBalance);
                recBankLedgEntryExt2."Running Balance" := CalcRunningAccBalance.GetBankAccBalance(recBankLedgEntry);
                recBankLedgEntryExt2."Running Balance (LCY)" := CalcRunningAccBalance.GetBankAccBalanceLCY(recBankLedgEntry);
                recBankLedgEntryExt2."Debit Amount" := recBankLedgEntry."Debit Amount";
                recBankLedgEntryExt2."Credit Amount" := recBankLedgEntry."Credit Amount";
                recBankLedgEntryExt2.Amount := recBankLedgEntry.Amount;
                recBankLedgEntryExt2."Debit Amount (LCY)" := recBankLedgEntry."Debit Amount (LCY)";
                recBankLedgEntryExt2."Credit Amount (LCY)" := recBankLedgEntry."Credit Amount (LCY)";
                recBankLedgEntryExt2."Amount (LCY)" := recBankLedgEntry."Amount (LCY)";
                recBankLedgEntryExt2.Description := recBankLedgEntry.Description;
                recBankLedgEntryExt2.Particulars := recBankLedgEntry.BELOParticulars;
                IF recBankLedgEntryExt2.Insert() then;
            until recBankLedgEntry.Next() = 0;
    end;

    var
        myInt: Integer;
}

