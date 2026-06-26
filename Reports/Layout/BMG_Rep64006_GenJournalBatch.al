report 64006 BMGGeneralJournalBatch
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\BMGGenJournalBatch.rdl';
    dataset
    {
        dataitem(GenJournalBatch; "Gen. Journal Batch")
        {
            DataItemTableView = where("Journal Template Name" = const('GENERAL'));
            column(JournalTemplateName; GenJournalBatch."Journal Template Name")
            {
            }
            column(Name; GenJournalBatch.Name)
            {
            }
            column(Description; GenJournalBatch.Description)
            {
            }
            column(BalAccountType; GenJournalBatch."Bal. Account Type")
            {
            }
            column(BalAccountNo; GenJournalBatch."Bal. Account No.")
            {
            }
            column(NoSeries; GenJournalBatch."No. Series")
            {
            }
            column(PostingNoSeries; GenJournalBatch."Posting No. Series")
            {
            }
            column(ReasonCode; GenJournalBatch."Reason Code")
            {
            }
            column(CopyVATSetupToJnlLines; GenJournalBatch."Copy VAT Setup to Jnl. Lines")
            {
            }
            column(AllowVATDifference; GenJournalBatch."Allow VAT Difference")
            {
            }
            column(JournalLineCount; GetJournalLineCount(GenJournalBatch))
            {
            }
        }
    }

    /*
    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = Excel;
            LayoutFile = 'mySpreadsheet.xlsx';
        }
    }
    */

    procedure GetJournalLineCount(GenJournalBatch: Record "Gen. Journal Batch"): Integer
    var
        GenJournalLine: Record "Gen. Journal Line";
    begin
        GenJournalLine.SetRange("Journal Template Name", GenJournalBatch."Journal Template Name");
        GenJournalLine.SetRange("Journal Batch Name", GenJournalBatch.Name);
        exit(GenJournalLine.Count());
    end;

    var
        myInt: Integer;
}