pageextension 64025 BMGBankAccLedgerEntriesExt extends "Bank Account Ledger Entries"
{

    ModifyAllowed = true;

    layout
    {
        // Add changes to page layout here
        addafter(RunningBalanceLCY)
        {
            field("BMG Running Balance"; Rec."BMG Running Balance")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("BMG Running Balance (LCY)"; Rec."BMG Running Balance (LCY)")
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter("Reverse Transaction")
        {
            action(UpdateBankLedgEntry)
            {
                Caption = 'Update Bank Acc. Ledg. Entry Ext Table';
                ApplicationArea = All;
                Image = Refresh;
                Visible = true;
                trigger OnAction()
                var
                    CalcRunningAccBalance: Codeunit "Calc. Running Acc. Balance";
                    recBankLedgEntryExt: Record BMGBankLedgEntryExt;
                    recBankLedgEntryExt2: Record BMGBankLedgEntryExt;
                    recBankLedgEntry: Record "Bank Account Ledger Entry";
                    datRefDate: Date;
                begin
                    recBankLedgEntryExt.DeleteAll();
                    myInt := 0;
                    myInt2 := 0;
                    datRefDate := 20260423D;
                    recBankLedgEntry.Reset();
                    //recBankLedgEntry.SetFilter("Posting Date", '>=%1', datRefDate);

                    if recBankLedgEntry.FindSet() then
                        repeat
                            //recBankLedgEntryExt.Reset();
                            //recBankLedgEntryExt.SetRange("Entry No.", recBankLedgEntry."Entry No.");

                            //if not recBankLedgEntryExt.FindFirst() then begin
                            myInt += 1;
                            recBankLedgEntryExt.Init();
                            recBankLedgEntryExt."Entry No." := recBankLedgEntry."Entry No.";
                            recBankLedgEntryExt."Bank Account No." := recBankLedgEntry."Bank Account No.";
                            recBankLedgEntryExt."Posting Date" := recBankLedgEntry."Posting Date";
                            Clear(CalcRunningAccBalance);
                            recBankLedgEntryExt."Running Balance" := CalcRunningAccBalance.GetBankAccBalance(recBankLedgEntry);
                            recBankLedgEntryExt."Running Balance (LCY)" := CalcRunningAccBalance.GetBankAccBalanceLCY(recBankLedgEntry);
                            recBankLedgEntryExt."Debit Amount" := recBankLedgEntry."Debit Amount";
                            recBankLedgEntryExt."Credit Amount" := recBankLedgEntry."Credit Amount";
                            recBankLedgEntryExt.Amount := recBankLedgEntry.Amount;
                            recBankLedgEntryExt."Debit Amount (LCY)" := recBankLedgEntry."Debit Amount (LCY)";
                            recBankLedgEntryExt."Credit Amount (LCY)" := recBankLedgEntry."Credit Amount (LCY)";
                            recBankLedgEntryExt."Amount (LCY)" := recBankLedgEntry."Amount (LCY)";
                            recBankLedgEntryExt.Description := recBankLedgEntry.Description;
                            recBankLedgEntryExt.Particulars := recBankLedgEntry.BELOParticulars;
                            recBankLedgEntryExt.Insert();
                        //end else begin
                        /*    myInt2 += 1;
                            recBankLedgEntryExt."Bank Account No." := recBankLedgEntry."Bank Account No.";
                            recBankLedgEntryExt."Posting Date" := recBankLedgEntry."Posting Date";
                            Clear(CalcRunningAccBalance);
                            recBankLedgEntryExt."Running Balance" := CalcRunningAccBalance.GetBankAccBalance(recBankLedgEntry);
                            recBankLedgEntryExt."Running Balance (LCY)" := CalcRunningAccBalance.GetBankAccBalanceLCY(recBankLedgEntry);
                            recBankLedgEntryExt."Debit Amount" := recBankLedgEntry."Debit Amount";
                            recBankLedgEntryExt."Credit Amount" := recBankLedgEntry."Credit Amount";
                            recBankLedgEntryExt.Amount := recBankLedgEntry.Amount;
                            recBankLedgEntryExt.Modify();
                        end;
                        */
                        until recBankLedgEntry.Next() = 0;

                    Message('%1 records have been inserted.\%2 records have been modified.', myInt, myInt2);
                end;
            }
            action(UpdateRunningBalance)
            {
                Caption = 'Update Running Balances';
                ApplicationArea = All;
                Image = UpdateDescription;
                Visible = true;
                trigger OnAction()
                var
                    CalcRunningAccBalance: Codeunit "Calc. Running Acc. Balance";
                    recBankLedgEntryExt: Record BMGBankLedgEntryExt;
                    recBankLedgEntryExt2: Record BMGBankLedgEntryExt;
                    recBankLedgEntry: Record "Bank Account Ledger Entry";
                    datRefDate: Date;
                begin
                    recBankLedgEntryExt.Reset();

                    myInt := 0;
                    if recBankLedgEntryExt.FindFirst() then
                        repeat
                            recBankLedgEntry.Reset();
                            recBankLedgEntry.SetRange("Entry No.", recBankLedgEntryExt."Entry No.");

                            if recBankLedgEntry.FindFirst() then begin
                                recBankLedgEntryExt."Running Balance" := CalcRunningAccBalance.GetBankAccBalance(recBankLedgEntry);
                                recBankLedgEntryExt."Running Balance (LCY)" := CalcRunningAccBalance.GetBankAccBalanceLCY(recBankLedgEntry);
                                recBankLedgEntryExt.Modify();
                                myInt += 1;
                            end;


                        until recBankLedgEntryExt.Next() = 0;

                    Message('%1 records have been updated.');
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    var

    begin

    end;

    var
        myInt: Integer;
        myInt2: Integer;
}