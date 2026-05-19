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
        // Add changes to page actions here
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