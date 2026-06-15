report 64005 BMGMemberPointEntry
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\BMGMemberPointsEntry.rdl';
    //DefaultRenderingLayout = LayoutName;

    dataset
    {


        dataitem(MemberPointEntry; "LSC Member Point Entry")
        {

            column(PatientID; "Account No.")
            {
            }
            column(PatientName; GetPatientName("Account No."))
            {
            }
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

                if MemberPointEntry."Remaining Points" = 0 then
                    CurrReport.Skip();
            end;
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
    local procedure GetPatientName(codPatientID: Code[20]): Text[50]
    var
        recMemberAccount: Record "LSC Member Account";
    begin
        if recMemberAccount.Get(codPatientID) then
            exit(recMemberAccount.Description);
        exit('');
    end;

    var
        myInt: Integer;
        datFromDate: Date;
        datToDate: Date;
}