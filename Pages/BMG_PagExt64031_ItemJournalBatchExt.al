pageextension 64031 BMGItemJournalBatchExt extends "Item Journal Batches"
{
    layout
    {
        // Add changes to page layout here
        addafter("No. Series")
        {
            field(NoOfLines; intNoOfLineRec)
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
        recItemJnlLine.Reset();
        recItemJnlLine.SetRange("Journal Template Name", Rec."Journal Template Name");
        recItemJnlLine.SetRange("Journal Batch Name", Rec.Name);

        intNoOfLineRec := 0;

        if recItemJnlLine.FindSet() then
            intNoOfLineRec := recItemJnlLine.Count;
    end;

    var
        myInt: Integer;
        intNoOfLineRec: Integer;
        recItemJnlLine: Record "Item Journal Line";
}