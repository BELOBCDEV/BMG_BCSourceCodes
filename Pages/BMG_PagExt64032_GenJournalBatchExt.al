pageextension 64032 BMGGenJournalBatchExt extends "General Journal Batches"
{
    layout
    {
        // Add changes to page layout here
        addafter("No. Series")
        {
            field(NoOfRecLines; intNoOfLineRec)
            {
                Caption = 'No. of Line Records';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action(PrintGenJournalBatch)
            {
                ApplicationArea = All;
                Caption = 'Gen. Journal Batch Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    GenJournalBatch: Record "Gen. Journal Batch";
                begin
                    GenJournalBatch.SetRange("Journal Template Name", Rec."Journal Template Name");
                    //GenJournalBatch.SetRange(Name, Rec.Name);
                    Report.RunModal(Report::BMGGeneralJournalBatch, true, false, GenJournalBatch);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        recGenJnlLine.Reset();
        recGenJnlLine.SetRange("Journal Template Name", Rec."Journal Template Name");
        recGenJnlLine.SetRange("Journal Batch Name", Rec.Name);

        intNoOfLineRec := 0;

        if recGenJnlLine.FindSet() then
            intNoOfLineRec := recGenJnlLine.Count;

    end;

    var
        myInt: Integer;
        intNoOfLineRec: Integer;
        recGenJnlLine: Record "Gen. Journal Line";
}