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
        addlast(processing)
        {
            action(ExportToExcel)
            {
                ApplicationArea = All;
                Caption = 'Export to Excel';
                Image = ExportToExcel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ItemJournalBatch: Record "Item Journal Batch";
                    TempExcelBuffer: Record "Excel Buffer" temporary;
                    ItemJnlLine: Record "Item Journal Line";
                    LineCount: Integer;
                begin
                    TempExcelBuffer.DeleteAll();

                    TempExcelBuffer.NewRow();
                    TempExcelBuffer.AddColumn('Journal Template Name', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn('Name', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn('Description', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn('No. Series', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn('No. of Line Records', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);

                    ItemJournalBatch.Reset();
                    //ItemJournalBatch.SetRange("Journal Template Name", 'ITEM');
                    if ItemJournalBatch.FindSet() then
                        repeat
                            ItemJnlLine.Reset();
                            ItemJnlLine.SetRange("Journal Template Name", ItemJournalBatch."Journal Template Name");
                            ItemJnlLine.SetRange("Journal Batch Name", ItemJournalBatch.Name);
                            LineCount := ItemJnlLine.Count();

                            TempExcelBuffer.NewRow();
                            TempExcelBuffer.AddColumn(ItemJournalBatch."Journal Template Name", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                            TempExcelBuffer.AddColumn(ItemJournalBatch.Name, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                            TempExcelBuffer.AddColumn(ItemJournalBatch.Description, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                            TempExcelBuffer.AddColumn(ItemJournalBatch."No. Series", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                            TempExcelBuffer.AddColumn(LineCount, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                        until ItemJournalBatch.Next() = 0;

                    TempExcelBuffer.CreateNewBook('Item Journal Batches');
                    TempExcelBuffer.WriteSheet('Item Journal Batches', CompanyName(), UserId());
                    TempExcelBuffer.CloseBook();
                    TempExcelBuffer.SetFriendlyFilename('Item Journal Batches');
                    TempExcelBuffer.OpenExcel();

                end;
            }
        }
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