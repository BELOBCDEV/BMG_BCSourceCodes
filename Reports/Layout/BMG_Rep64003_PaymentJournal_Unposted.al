report 64003 BMGPaymentJournalUnposted
{
    Caption = 'List of Unposted Payment Jnl.';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = GenJournal;

    dataset
    {
        dataitem(PJBatch_General; "Gen. Journal Batch")
        {
            DataItemTableView = WHERE("Journal Template Name" = CONST('PAYMENT'));
            column(Name; Name)
            {

            }
            column(NoOfLines; intNoOfLines)
            {

            }
            column(ReportCaption; lblReportCaption)
            {

            }

            trigger OnAfterGetRecord()
            var
                recGenJnlLine: Record "Gen. Journal Line";
            begin

                intNoOfLines := 0;

                recGenJnlLine.Reset();
                recGenJnlLine.SetRange("Journal Batch Name", Name);

                if recGenJnlLine.FindSet() then
                    intNoOfLines := recGenJnlLine.Count;

                if bolHideZeroCount then
                    if intNoOfLines = 0 then
                        CurrReport.Skip();

            end;

        }


    }

    requestpage
    {
        //AboutTitle = 'Teaching tip title';
        //AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(ReportFilter)
                {
                    field(HideZeroCount; bolHideZeroCount)
                    {
                        Caption = 'Hide Zero Count';
                        ApplicationArea = All;
                    }

                }
            }
        }


    }

    rendering
    {
        layout(GenJournal)
        {
            Type = RDLC;
            LayoutFile = '.\Reports\Layout\PaymentJournal_Unposted.rdl';
        }
    }

    var
        myInt: Integer;
        intNoOfLines: Integer;
        intNoOfLines2: Integer;
        bolHideZeroCount: Boolean;
        txtReportCaption: Text[200];
        lblReportCaption: Label 'PAYMENT JOURNAL BATCHES';

}