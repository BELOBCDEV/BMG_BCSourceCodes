report 64004 BMGMemberAccountPointsInfo
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\BMGMemberAccountPointsInfo.rdl';
    //DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(MemberAccount; "LSC Member Account")
        {
            PrintOnlyIfDetail = true;
            column(PatientID; MemberAccount."No.")
            {
            }
            column(PatientName; MemberAccount.Description)
            {
            }

            dataitem(MemberPointEntry; "LSC Member Point Entry")
            {
                DataItemLink = "Account No." = field("No.");

                column(SourceType; MemberPointEntry."Source Type")
                {
                }
                column(DocumentNo; MemberPointEntry."Document No.")
                {
                }
                column(Date; MemberPointEntry.Date)
                {
                }
                column(EntryType; MemberPointEntry."Entry Type")
                {
                }
                column(RemainingPoints; MemberPointEntry."Remaining Points")
                {
                }
                column(ExpirationDate; MemberPointEntry."Expiration Date")
                {
                }

                trigger OnPreDataItem()
                begin
                    SetCurrentKey("Account No.", "Entry Type", "Point Type");
                    if (datFromDate <> 0D) and (datToDate <> 0D) then
                        SetRange(Date, datFromDate, datToDate);
                end;

                trigger OnAfterGetRecord()
                begin
                    if MemberPointEntry."Closed by Points" <> 0 then
                        CurrReport.Skip();

                    if MemberPointEntry."Expiration Date" = 0D then
                        MemberPointEntry."Expiration Date" := MemberPointEntry."BMG Orig. Expiry Date";
                end;
            }

        }
    }


    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(ReportFilter)
                {
                    field(StartDate; datFromDate)
                    {
                        ApplicationArea = All;
                    }
                    field(EndDate; datToDate)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
        /*
         actions
         {
             area(processing)
             {
                 action(LayoutName)
                 {

                 }
             }
         }
         */
    }

    /*
    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'MemberAccountExpirationInfo.rdl';
        }
    }
    */

    var
        myInt: Integer;
        datFromDate: Date;
        datToDate: Date;
}