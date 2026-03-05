report 64000 SalesAmountByBranch
{

    Caption = 'Sales Amount By Branches';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\SalesAmountByBranches.rdl';


    dataset
    {
        dataitem(DataItemName; "Dimension Value")
        {
            DataItemTableView = WHERE("Dimension Code" = CONST('BRANCHES'));
            column(ColumnName; Code)
            {

            }
            column(Name; Name)
            {

            }
            column(SalesAmount; decSalesAmount)
            {

            }
            column(RecCount; intCounter)
            {

            }
            column(CompanyName; txtCompanyName)
            {

            }
            column(StartDate; datStartDate)
            {

            }
            column(EndDate; datEndDate)
            {

            }
            column(ShowRecordCount; bolShowRecCount)
            {

            }

            trigger OnPreDataItem()
            begin
                if datStartDate = 0D then
                    Error('Start Date is required.');
                if datEndDate = 0D then
                    Error(('End Date is required.'));
            end;

            trigger OnAfterGetRecord()
            var
                recItemLedgEntry: Record "Item Ledger Entry";
            begin
                case CompanySelection Of
                    0:
                        begin
                            recItemLedgEntry.Reset();
                            recItemLedgEntry.ChangeCompany('IBSSI');
                            recItemLedgEntry.SetRange("Posting Date", datStartDate, datEndDate);
                            recItemLedgEntry.SetRange("Global Dimension 1 Code", Code);

                            decSalesAmount := 0;
                            intCounter := 0;

                            if recItemLedgEntry.FindFirst() then
                                repeat
                                    intCounter += 1;
                                    recItemLedgEntry.CalcFields("Sales Amount (Actual)");
                                    decSalesAmount += recItemLedgEntry."Sales Amount (Actual)";
                                until recItemLedgEntry.Next() = 0;

                            if bolHide then begin
                                if decSalesAmount = 0 then
                                    CurrReport.Skip();
                            end;

                            txtCompanyName := 'IBSSI';
                        end;
                    1:
                        begin
                            recItemLedgEntry.Reset();
                            recItemLedgEntry.ChangeCompany('LSSI');
                            recItemLedgEntry.SetRange("Posting Date", datStartDate, datEndDate);
                            recItemLedgEntry.SetRange("Global Dimension 1 Code", Code);

                            decSalesAmount := 0;
                            intCounter := 0;

                            if recItemLedgEntry.FindFirst() then
                                repeat
                                    intCounter += 1;
                                    recItemLedgEntry.CalcFields("Sales Amount (Actual)");
                                    decSalesAmount += recItemLedgEntry."Sales Amount (Actual)";
                                until recItemLedgEntry.Next() = 0;

                            txtCompanyName := 'LSSI';

                            if bolHide then begin
                                if decSalesAmount = 0 then
                                    CurrReport.Skip();
                            end;


                        end;
                    2:
                        begin
                            recItemLedgEntry.ChangeCompany('IBSSI');
                            recItemLedgEntry.Reset();
                            recItemLedgEntry.SetRange("Posting Date", datStartDate, datEndDate);
                            recItemLedgEntry.SetRange("Global Dimension 1 Code", Code);

                            decSalesAmount := 0;
                            intCounter := 0;

                            if recItemLedgEntry.FindFirst() then
                                repeat
                                    intCounter += 1;
                                    recItemLedgEntry.CalcFields("Sales Amount (Actual)");
                                    decSalesAmount += recItemLedgEntry."Sales Amount (Actual)";
                                until recItemLedgEntry.Next() = 0;

                            recItemLedgEntry.ChangeCompany('LSSI');
                            recItemLedgEntry.Reset();
                            recItemLedgEntry.SetRange("Posting Date", datStartDate, datEndDate);
                            recItemLedgEntry.SetRange("Global Dimension 1 Code", Code);

                            if recItemLedgEntry.FindFirst() then
                                repeat
                                    intCounter += 1;
                                    recItemLedgEntry.CalcFields("Sales Amount (Actual)");
                                    decSalesAmount += recItemLedgEntry."Sales Amount (Actual)";
                                until recItemLedgEntry.Next() = 0;

                            txtCompanyName := 'IBSSI and LSSI';

                            if bolHide then begin
                                if decSalesAmount = 0 then
                                    CurrReport.Skip();
                            end;

                        end;
                end; //case


            end;

        }

    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                group(Filter)
                {
                    field(StartDate; datStartDate)
                    {
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            datEndDate := CALCDATE('CM', datStartDate);
                        end;
                    }
                    field(EndDate; datEndDate)
                    {
                        ApplicationArea = All;
                    }
                    field(HideZeroAmount; bolHide)
                    {
                        ApplicationArea = All;
                        Caption = 'Hide Zero Amt.';
                    }
                    field(ShowRecordCount; bolShowRecCount)
                    {
                        Caption = 'Show Record Count';
                        ApplicationArea = All;
                    }
                    field(CompanySelection; CompanySelection)
                    {
                        ApplicationArea = All;
                        OptionCaption = 'IBSSI,LSSI,IBSSI+LSSI';
                        Caption = 'Select Company';

                        trigger OnValidate()
                        begin

                            if CompanySelection = 0 then
                                txtCompanyName := 'IBSSI';
                            if CompanySelection = 1 then
                                txtCompanyName := 'LSSI';
                            if CompanySelection = 2 then
                                txtCompanyName := 'IBSSI and LSSI';
                        end;
                    }
                }
            }
        }

    }

    trigger OnPreReport()
    begin
        //CompanySelection := 0;
        //txtCompanyName := 'IBSSI';
    end;

    var
        myInt: Integer;
        datStartDate: Date;
        datEndDate: Date;
        intCounter: Integer;
        decSalesAmount: Decimal;
        bolHide: Boolean;
        CompanySelection: Option;
        txtCompanyName: Text[100];
        bolShowRecCount: Boolean;
}