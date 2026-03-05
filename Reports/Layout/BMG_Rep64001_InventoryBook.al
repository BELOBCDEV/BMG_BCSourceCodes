report 64001 BMGItemRegister
{

    Caption = 'BMG Inventory Books';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\Layout\BMGItemRegister.rdl';

    dataset
    {
        dataitem("Item Register"; "Item Register")
        {
            DataItemTableView = SORTING("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(CompanyName; CompanyInfo.GetCompanyName_PHL())
            {
            }
            column(CompanyAddr1; CompanyAddr[1])
            {
            }
            column(CompanyAddr2; CompanyAddr[2])
            {
            }
            column(CompanyAddr3; CompanyAddr[3])
            {
            }
            column(CompanyAddr4; CompanyAddr[4])
            {
            }
            column(CompanyAddr5; CompanyAddr[5])
            {
            }
            column(CompanyInfoAddress; CompanyInfo.Address)
            {
            }
            column(CompanyInfoAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfoEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfoAppName; CompanyInfo."Application Name PHL")
            {
            }
            column(CompanyInfoVerNo; CompanyInfo."Application Version No. PHL")
            {
            }
            column(CompanyInfoAppNameCaption; CompanyInfo.FieldCaption("Application Name PHL"))
            {
            }
            column(CompanyInfoVerNoCaption; CompanyInfo.FieldCaption("Application Version No. PHL"))
            {
            }
            column(CompanyInfoBIRSerNo; CompanyInfo."BIR Serial No. PHL")
            {
            }
            column(CompanyInfoBIRPermitNo; CompanyInfo."BIR Permit No. PHL")
            {
            }
            column(CompanyInfoDateIssued; CompanyInfo."Date Issued PHL")
            {
            }
            column(CompanyInfoBIRPermitNo_Caption; CompanyInfoBIRPermitNoCaption)
            {
            }
            column(CompanyInfoDateIssued_Caption; CompanyInfoDateIssuedCaption)
            {
            }
            column(ItemRegistryCaption; TABLECAPTION + ': ' + ItemRegFilter)
            {
            }
            column(No_ItemRegister; "No.")
            {
            }
            column(ItemEntryTypeTotalCost1; ItemEntryTypeTotalCost[1])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalAmount1; ItemEntryTypeTotalAmount[1])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeDescription1; ItemEntryTypeDescription[1])
            {
            }
            column(EntryTypeTotalCost1; EntryTypeTotalCost[1])
            {
                AutoFormatType = 1;
            }
            column(EntryTypeDescription1; EntryTypeDescription[1])
            {
            }
            column(ShowTotalLineSummary1; ShowTotalLineSummary[1])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCostExp1; ItemEntryTypeTotalCostExp[1])
            {
                AutoFormatType = 1;
            }
            column(EntryTypeTotalCostExp1; EntryTypeTotalCostExp[1])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCost2; ItemEntryTypeTotalCost[2])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalAmount2; ItemEntryTypeTotalAmount[2])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeDescription2; ItemEntryTypeDescription[2])
            {
            }
            column(EntryTypeTotalCost2; EntryTypeTotalCost[2])
            {
                AutoFormatType = 1;
            }
            column(EntryTypeDescription2; EntryTypeDescription[2])
            {
            }
            column(ShowTotalLineSummary2; ShowTotalLineSummary[2])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCostExp2; ItemEntryTypeTotalCostExp[2])
            {
                AutoFormatType = 1;
            }
            column(EntryTypeTotalCostExp2; EntryTypeTotalCostExp[2])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCost3; ItemEntryTypeTotalCost[3])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalAmount3; ItemEntryTypeTotalAmount[3])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeDescription3; ItemEntryTypeDescription[3])
            {
            }
            column(EntryTypeTotalCost3; EntryTypeTotalCost[3])
            {
                AutoFormatType = 1;
            }
            column(EntryTypeDescription3; EntryTypeDescription[3])
            {
            }
            column(ShowTotalLineSummary3; ShowTotalLineSummary[3])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCostExp3; ItemEntryTypeTotalCostExp[3])
            {
                AutoFormatType = 1;
            }
            column(EntryTypeTotalCostExp3; EntryTypeTotalCostExp[3])
            {
                AutoFormatType = 1;
            }
            column(EntryTypeTotalCost4; EntryTypeTotalCost[4])
            {
                AutoFormatType = 1;
            }
            column(EntryTypeDescription4; EntryTypeDescription[4])
            {
            }
            column(ItemEntryTypeDescription4; ItemEntryTypeDescription[4])
            {
            }
            column(ItemEntryTypeTotalAmount4; ItemEntryTypeTotalAmount[4])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCost4; ItemEntryTypeTotalCost[4])
            {
                AutoFormatType = 1;
            }
            column(ShowTotalLineSummary4; ShowTotalLineSummary[4])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCostExp4; ItemEntryTypeTotalCostExp[4])
            {
                AutoFormatType = 1;
            }
            column(EntryTypeTotalCostExp4; EntryTypeTotalCostExp[4])
            {
                AutoFormatType = 1;
            }
            column(EntryTypeTotalCost5; EntryTypeTotalCost[5])
            {
                AutoFormatType = 1;
            }
            column(EntryTypeDescription5; EntryTypeDescription[5])
            {
            }
            column(ItemEntryTypeTotalAmount5; ItemEntryTypeTotalAmount[5])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeDescription5; ItemEntryTypeDescription[5])
            {
            }
            column(ItemEntryTypeTotalCost5; ItemEntryTypeTotalCost[5])
            {
                AutoFormatType = 1;
            }
            column(ShowTotalLineSummary5; ShowTotalLineSummary[5])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCostExp5; ItemEntryTypeTotalCostExp[5])
            {
                AutoFormatType = 1;
            }
            column(EntryTypeTotalCostExp5; EntryTypeTotalCostExp[5])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeDescription6; ItemEntryTypeDescription[6])
            {
            }
            column(ItemEntryTypeTotalAmount6; ItemEntryTypeTotalAmount[6])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCost6; ItemEntryTypeTotalCost[6])
            {
                AutoFormatType = 1;
            }
            column(ShowTotalLineSummary6; ShowTotalLineSummary[6])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCostExp6; ItemEntryTypeTotalCostExp[6])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCost7; ItemEntryTypeTotalCost[7])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalAmount7; ItemEntryTypeTotalAmount[7])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeDescription7; ItemEntryTypeDescription[7])
            {
            }
            column(ShowTotalLineSummary7; ShowTotalLineSummary[7])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCostExp7; ItemEntryTypeTotalCostExp[7])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCost8; ItemEntryTypeTotalCost[8])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalAmount8; ItemEntryTypeTotalAmount[8])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeDescription8; ItemEntryTypeDescription[8])
            {
            }
            column(ShowTotalLineSummary8; ShowTotalLineSummary[8])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCostExp8; ItemEntryTypeTotalCostExp[8])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeDescription9; ItemEntryTypeDescription[9])
            {
            }
            column(ItemEntryTypeTotalAmount9; ItemEntryTypeTotalAmount[9])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCost9; ItemEntryTypeTotalCost[9])
            {
                AutoFormatType = 1;
            }
            column(ShowTotalLineSummary9; ShowTotalLineSummary[9])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCostExp9; ItemEntryTypeTotalCostExp[9])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeDescription10; ItemEntryTypeDescription[10])
            {
            }
            column(ItemEntryTypeTotalAmount10; ItemEntryTypeTotalAmount[10])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCost10; ItemEntryTypeTotalCost[10])
            {
                AutoFormatType = 1;
            }
            column(ShowTotalLineSummary10; ShowTotalLineSummary[10])
            {
                AutoFormatType = 1;
            }
            column(ItemEntryTypeTotalCostExp10; ItemEntryTypeTotalCostExp[10])
            {
                AutoFormatType = 1;
            }
            column(CostAmountActual_ValueEntry; "Value Entry"."Cost Amount (Actual)")
            {
            }
            column(SalesAmountActual_ValueEntry; "Value Entry"."Sales Amount (Actual)")
            {
            }
            column(CostAmountExpected_ValueEntry; "Value Entry"."Cost Amount (Expected)")
            {
            }
            column(ItemRegisterValueCaption; ItemRegisterValueCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(ValEntyItmLedgEntyTypCptn; ValEntyItmLedgEntyTypCptnLbl)
            {
            }
            column(ItemDescriptionCaption; ItemDescriptionCaptionLbl)
            {
            }
            column(ValueEntrySalesAmtActCptn; ValueEntrySalesAmtActCptnLbl)
            {
            }
            column(UnitAmountCaption; UnitAmountCaptionLbl)
            {
            }
            column(ItemRegisterNoCaption; ItemRegisterNoCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            dataitem("Value Entry"; "Value Entry")
            {
                DataItemTableView = SORTING("Entry No.");
                RequestFilterFields = "Posting Date";
                column(EntryNo_ValueEntry; "Entry No.")
                {
                    IncludeCaption = true;
                }
                column(CostAmountActual1_ValueEntry; "Cost Amount (Actual)")
                {
                    AutoFormatType = 1;
                    IncludeCaption = true;
                }
                column(CostperUnit_ValueEntry; "Cost per Unit")
                {
                    IncludeCaption = true;
                }
                column(SalesAmountActual1_ValueEntry; SalesAmountActual) //"Sales Amount (Actual)")
                {
                }
                column(UnitAmount; UnitAmount)
                {
                    AutoFormatType = 2;
                }
                column(InvoicedQuantity_ValueEntry; "Invoiced Quantity")
                {
                    IncludeCaption = true;
                }
                column(ItemLedgerEntryType_ValueEntry; "Item Ledger Entry Type")
                {
                }
                column(PostingDate_ValueEntry; "Posting Date")
                {
                    IncludeCaption = true;
                }
                column(ItemDescription; ItemDescription)
                {
                }
                column(ItemNo_ValueEntry; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(ItemLedgerEntryNo_ValueEntry; "Item Ledger Entry No.")
                {
                    IncludeCaption = true;
                }
                column(EntryType_ValueEntry; "Entry Type")
                {
                    IncludeCaption = true;
                }
                column(CostAmountExpected1_ValueEntry; "Cost Amount (Expected)")
                {
                    IncludeCaption = true;
                }
                column(ItemEntryTypeDescription11; ItemEntryTypeDescription[1])
                {
                }
                column(ItemEntryTypeTotalAmount11; ItemEntryTypeTotalAmount[1])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCost11; ItemEntryTypeTotalCost[1])
                {
                    AutoFormatType = 1;
                }
                column(EntryTypeTotalCost11; EntryTypeTotalCost[1])
                {
                    AutoFormatType = 1;
                }
                column(EntryTypeDescription11; EntryTypeDescription[1])
                {
                }
                column(ShowItemLineSummary1; ShowItemLineSummary[1])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCostExp11; ItemEntryTypeTotalCostExp[1])
                {
                    AutoFormatType = 1;
                }
                column(EntryTypeTotalCostExp11; EntryTypeTotalCostExp[1])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCost12; ItemEntryTypeTotalCost[2])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalAmount12; ItemEntryTypeTotalAmount[2])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeDescription12; ItemEntryTypeDescription[2])
                {
                }
                column(EntryTypeDescription12; EntryTypeDescription[2])
                {
                }
                column(EntryTypeTotalCost12; EntryTypeTotalCost[2])
                {
                    AutoFormatType = 1;
                }
                column(ShowItemLineSummary2; ShowItemLineSummary[2])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCostExp12; ItemEntryTypeTotalCostExp[2])
                {
                    AutoFormatType = 1;
                }
                column(EntryTypeTotalCostExp12; EntryTypeTotalCostExp[2])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCost13; ItemEntryTypeTotalCost[3])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalAmount13; ItemEntryTypeTotalAmount[3])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeDescription13; ItemEntryTypeDescription[3])
                {
                }
                column(EntryTypeDescription13; EntryTypeDescription[3])
                {
                }
                column(EntryTypeTotalCost13; EntryTypeTotalCost[3])
                {
                    AutoFormatType = 1;
                }
                column(ShowItemLineSummary3; ShowItemLineSummary[3])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCostExp13; ItemEntryTypeTotalCostExp[3])
                {
                    AutoFormatType = 1;
                }
                column(EntryTypeTotalCostExp13; EntryTypeTotalCostExp[3])
                {
                    AutoFormatType = 1;
                }
                column(EntryTypeDescription14; EntryTypeDescription[4])
                {
                }
                column(EntryTypeTotalCost14; EntryTypeTotalCost[4])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCost14; ItemEntryTypeTotalCost[4])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalAmount14; ItemEntryTypeTotalAmount[4])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeDescription14; ItemEntryTypeDescription[4])
                {
                }
                column(ShowItemLineSummary4; ShowItemLineSummary[4])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCostExp14; ItemEntryTypeTotalCostExp[4])
                {
                    AutoFormatType = 1;
                }
                column(EntryTypeTotalCostExp14; EntryTypeTotalCostExp[4])
                {
                    AutoFormatType = 1;
                }
                column(EntryTypeDescription15; EntryTypeDescription[5])
                {
                }
                column(EntryTypeTotalCost15; EntryTypeTotalCost[5])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeDescription15; ItemEntryTypeDescription[5])
                {
                }
                column(ItemEntryTypeTotalAmount15; ItemEntryTypeTotalAmount[5])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCost15; ItemEntryTypeTotalCost[5])
                {
                    AutoFormatType = 1;
                }
                column(ShowItemLineSummary5; ShowItemLineSummary[5])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCostExp15; ItemEntryTypeTotalCostExp[5])
                {
                    AutoFormatType = 1;
                }
                column(EntryTypeTotalCostExp15; EntryTypeTotalCostExp[5])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeDescription16; ItemEntryTypeDescription[6])
                {
                }
                column(ItemEntryTypeTotalCost16; ItemEntryTypeTotalCost[6])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalAmount16; ItemEntryTypeTotalAmount[6])
                {
                    AutoFormatType = 1;
                }
                column(ShowItemLineSummary6; ShowItemLineSummary[6])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCostExp16; ItemEntryTypeTotalCostExp[6])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCost17; ItemEntryTypeTotalCost[7])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalAmount17; ItemEntryTypeTotalAmount[7])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeDescription17; ItemEntryTypeDescription[7])
                {
                }
                column(ShowItemLineSummary7; ShowItemLineSummary[7])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCostExp17; ItemEntryTypeTotalCostExp[7])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCost18; ItemEntryTypeTotalCost[8])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalAmount18; ItemEntryTypeTotalAmount[8])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeDescription18; ItemEntryTypeDescription[8])
                {
                }
                column(ShowItemLineSummary8; ShowItemLineSummary[8])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCostExp18; ItemEntryTypeTotalCostExp[8])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeDescription19; ItemEntryTypeDescription[9])
                {
                }
                column(ItemEntryTypeTotalAmount19; ItemEntryTypeTotalAmount[9])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCost19; ItemEntryTypeTotalCost[9])
                {
                    AutoFormatType = 1;
                }
                column(ShowItemLineSummary9; ShowItemLineSummary[9])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCostExp19; ItemEntryTypeTotalCostExp[9])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeDescription20; ItemEntryTypeDescription[10])
                {
                }
                column(ItemEntryTypeTotalAmount20; ItemEntryTypeTotalAmount[10])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCost20; ItemEntryTypeTotalCost[10])
                {
                    AutoFormatType = 1;
                }
                column(ShowItemLineSummary10; ShowItemLineSummary[10])
                {
                    AutoFormatType = 1;
                }
                column(ItemEntryTypeTotalCostExp20; ItemEntryTypeTotalCostExp[10])
                {
                    AutoFormatType = 1;
                }

                trigger OnAfterGetRecord();
                begin
                    if Item.GET("Item No.") then
                        ItemDescription := Item.Description;

                    if "Valued Quantity" <> 0 then
                        UnitAmount := ("Sales Amount (Actual)" + "Discount Amount") / "Valued Quantity"
                    else
                        UnitAmount := 0;

                    ItemEntryTypeTotalCost["Item Ledger Entry Type".AsInteger() + 1] := "Cost Amount (Actual)";
                    ItemEntryTypeTotalCostExp["Item Ledger Entry Type".AsInteger() + 1] := "Cost Amount (Expected)";
                    ItemEntryTypeTotalAmount["Item Ledger Entry Type".AsInteger() + 1] := "Sales Amount (Actual)";

                    ItemEntryTypeNoOfEntries["Item Ledger Entry Type".AsInteger() + 1] := 1;
                    EntryTypeNoOfEntries["Entry Type".AsInteger() + 1] := 1;

                    ShowItemLineSummary["Item Ledger Entry Type".AsInteger() + 1] := true;
                    ShowTotalLineSummary["Item Ledger Entry Type".AsInteger() + 1] := true;
                    EntryTypeTotalCost["Entry Type".AsInteger() + 1] := "Cost Amount (Actual)";
                    EntryTypeTotalCostExp["Entry Type".AsInteger() + 1] := "Cost Amount (Expected)";
                    ShowItemLineSummary["Entry Type".AsInteger() + 1] := true;
                    ShowTotalLineSummary["Entry Type".AsInteger() + 1] := true;

                    if not ShowExpected then
                        SalesAmountActual += "Sales Amount (Actual)";
                    if ShowExpected then
                        SalesAmountActual += "Sales Amount (Actual)" + "Sales Amount (Expected)";
                    SalesAmountExpected += "Sales Amount (Expected)";
                    CostAmountActual += "Cost Amount (Actual)";
                    CostAmountExpected += "Cost Amount (Expected)";

                    if IncludeTextFile then begin
                        if CSVBool then begin
                            ReportValue[1] := FORMAT("Value Entry"."Posting Date");
                            ReportValue[2] := FORMAT("Value Entry"."Entry Type");
                            ReportValue[3] := FORMAT("Value Entry"."Item No.");
                            ReportValue[4] := ItemDescription;
                            ReportValue[5] := FORMAT("Value Entry"."Invoiced Quantity");
                            ReportValue[6] := FORMAT(UnitAmount);
                            ReportValue[7] := FORMAT("Value Entry"."Sales Amount (Actual)");
                            ReportValue[8] := FORMAT("Value Entry"."Cost per Unit");
                            ReportValue[9] := FORMAT("Value Entry"."Cost Amount (Actual)");
                            ReportValue[10] := FORMAT("Value Entry"."Cost Amount (Expected)");
                            ReportValue[11] := FORMAT("Value Entry"."Item Ledger Entry Type");
                            ReportValue[12] := FORMAT("Value Entry"."Entry No.");
                            ReportValue[13] := FORMAT("Value Entry"."Item Ledger Entry No.");
                            WriteCSV(ReportValue);
                            CLEAR(ReportValue);
                        end else
                            WriteTextLine();
                    end;

                    if "Entry Type" = "Entry Type"::"Direct Cost" then begin
                        CostAmountActualDirectCost += "Cost Amount (Actual)";
                        CostAmountExpectDirectCost += "Cost Amount (Expected)";
                    end else
                        if "Entry Type" = "Entry Type"::Revaluation then begin
                            CostAmountActualRevaluation += "Cost Amount (Actual)";
                            CostAmountExpectRevaluation += "Cost Amount (Expected)";
                        end else
                            if "Entry Type" = "Entry Type"::Rounding then begin
                                CostAmountActualRounding += "Cost Amount (Actual)";
                                CostAmountExpectRounding += "Cost Amount (Expected)";
                            end else
                                if "Entry Type" = "Entry Type"::"Indirect Cost" then begin
                                    CostAmountActualIndirectCost += "Cost Amount (Actual)";
                                    CostAmountExpectIndirectCost += "Cost Amount (Expected)";
                                end else
                                    if "Entry Type" = "Entry Type"::Variance then begin
                                        CostAmountActualVariance += "Cost Amount (Actual)";
                                        CostAmountExpectVariance += "Cost Amount (Expected)";
                                    end;

                    if "Item Ledger Entry Type" = "Item Ledger Entry Type"::Purchase then begin
                        CostAmountActualPurchase += "Cost Amount (Actual)";
                        CostAmountExpectPurchase += "Cost Amount (Expected)";
                        if not ShowExpected then
                            SalesAmountActualPurchase += "Sales Amount (Actual)";
                        if ShowExpected then
                            SalesAmountActualPurchase += "Sales Amount (Actual)" + "Sales Amount (Expected)";
                    end else
                        if "Item Ledger Entry Type" = "Item Ledger Entry Type"::Sale then begin
                            CostAmountActualSale += "Cost Amount (Actual)";
                            CostAmountExpectSale += "Cost Amount (Expected)";
                            if not ShowExpected then
                                SalesAmountActualSale += "Sales Amount (Actual)";
                            if ShowExpected then
                                SalesAmountActualSale += "Sales Amount (Actual)" + "Sales Amount (Expected)";
                        end else
                            if "Item Ledger Entry Type" = "Item Ledger Entry Type"::"Positive Adjmt." then begin
                                CostAmountActualPosAdjmt += "Cost Amount (Actual)";
                                CostAmountExpectPosAdjmt += "Cost Amount (Expected)";
                                if not ShowExpected then
                                    SalesAmountActualPosAdjmt += "Sales Amount (Actual)";
                                if ShowExpected then
                                    SalesAmountActualPosAdjmt += "Sales Amount (Actual)" + "Sales Amount (Expected)";
                            end else
                                if "Item Ledger Entry Type" = "Item Ledger Entry Type"::"Negative Adjmt." then begin
                                    CostAmountActualNegAdjmt += "Cost Amount (Actual)";
                                    CostAmountExpectNegAdjmt += "Cost Amount (Expected)";
                                    if not ShowExpected then
                                        SalesAmountActualNegAdjmt += "Sales Amount (Actual)";
                                    if ShowExpected then
                                        SalesAmountActualNegAdjmt += "Sales Amount (Actual)" + "Sales Amount (Expected)";
                                end else
                                    if "Item Ledger Entry Type" = "Item Ledger Entry Type"::Transfer then begin
                                        CostAmountActualTransfer += "Cost Amount (Actual)";
                                        CostAmountExpectTransfer += "Cost Amount (Expected)";
                                        if not ShowExpected then
                                            SalesAmountActualTransfer += "Sales Amount (Actual)";
                                        if ShowExpected then
                                            SalesAmountActualTransfer += "Sales Amount (Actual)" + "Sales Amount (Expected)";
                                    end else
                                        if "Item Ledger Entry Type" = "Item Ledger Entry Type"::Consumption then begin
                                            CostAmountActualConsumption += "Cost Amount (Actual)";
                                            CostAmountExpectConsumption += "Cost Amount (Expected)";
                                            if not ShowExpected then
                                                SalesAmountActualConsumption += "Sales Amount (Actual)";
                                            if ShowExpected then
                                                SalesAmountActualConsumption += "Sales Amount (Actual)" + "Sales Amount (Expected)";
                                        end else
                                            if "Item Ledger Entry Type" = "Item Ledger Entry Type"::Output then begin
                                                CostAmountActualOutput += "Cost Amount (Actual)";
                                                CostAmountExpectOutput += "Cost Amount (Expected)";
                                                if not ShowExpected then
                                                    SalesAmountActualOutput += "Sales Amount (Actual)";
                                                if ShowExpected then
                                                    SalesAmountActualOutput += "Sales Amount (Actual)" + "Sales Amount (Expected)";
                                            end else
                                                if "Item Ledger Entry Type" = "Item Ledger Entry Type"::"Assembly Consumption" then begin
                                                    CostAmountActualAssConsumption += "Cost Amount (Actual)";
                                                    CostAmountExpectAssConsumption += "Cost Amount (Expected)";
                                                    if not ShowExpected then
                                                        SalesAmountActualAssConsumption += "Sales Amount (Actual)";
                                                    if ShowExpected then
                                                        SalesAmountActualAssConsumption += "Sales Amount (Actual)" + "Sales Amount (Expected)";
                                                end else
                                                    if "Item Ledger Entry Type" = "Item Ledger Entry Type"::"Assembly Output" then begin
                                                        CostAmountActualAssOutput += "Cost Amount (Actual)";
                                                        CostAmountExpectAssOutput += "Cost Amount (Expected)";
                                                        if not ShowExpected then
                                                            SalesAmountActualAssOutput += "Sales Amount (Actual)";
                                                        if ShowExpected then
                                                            SalesAmountActualAssOutput += "Sales Amount (Actual)" + "Sales Amount (Expected)";

                                                    end;
                end;

                trigger OnPostDataItem();
                begin
                    if IncludeTextFile then begin
                        if CSVBool then begin
                            if EntriesExist(1) then begin
                                ReportValue[2] := EntryTypeDescription[1];
                                "Value Entry".SETRANGE("Entry Type", "Entry Type"::"Direct Cost");
                                "Value Entry".CALCSUMS("Sales Amount (Actual)");
                                "Value Entry".CALCSUMS("Sales Amount (Expected)");
                                "Value Entry".CALCSUMS("Cost Amount (Actual)");
                                "Value Entry".CALCSUMS("Cost Amount (Expected)");
                                ReportValue[3] := FORMAT("Cost Amount (Actual)");
                                ReportValue[4] := FORMAT("Cost Amount (Expected)");
                                ReportValue[6] := ItemEntryTypeDescription[1];
                                ReportValue[7] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Purchase.AsInteger(), true, false, false));
                                ReportValue[9] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Purchase.AsInteger(), false, true, false));
                                ReportValue[10] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Purchase.AsInteger(), false, false, true));
                                WriteCSV(ReportValue);
                                CLEAR(ReportValue);
                            end;
                            if EntriesExist(2) then begin
                                ReportValue[2] := EntryTypeDescription[2];
                                "Value Entry".SETRANGE("Entry Type", "Entry Type"::Revaluation);
                                "Value Entry".CALCSUMS("Sales Amount (Actual)");
                                "Value Entry".CALCSUMS("Sales Amount (Expected)");
                                "Value Entry".CALCSUMS("Cost Amount (Actual)");
                                "Value Entry".CALCSUMS("Cost Amount (Expected)");
                                ReportValue[3] := FORMAT("Cost Amount (Actual)");
                                ReportValue[4] := FORMAT("Cost Amount (Expected)");
                                ReportValue[6] := ItemEntryTypeDescription[2];
                                ReportValue[7] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Sale.AsInteger(), true, false, false));
                                ReportValue[9] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Sale.AsInteger(), false, true, false));
                                ReportValue[10] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Sale.AsInteger(), false, false, true));
                                WriteCSV(ReportValue);
                                CLEAR(ReportValue);
                            end;
                            if EntriesExist(3) then begin
                                ReportValue[2] := EntryTypeDescription[3];
                                "Value Entry".SETRANGE("Entry Type", "Entry Type"::Rounding);
                                "Value Entry".CALCSUMS("Sales Amount (Actual)");
                                "Value Entry".CALCSUMS("Sales Amount (Expected)");
                                "Value Entry".CALCSUMS("Cost Amount (Actual)");
                                "Value Entry".CALCSUMS("Cost Amount (Expected)");
                                ReportValue[3] := FORMAT("Cost Amount (Actual)");
                                ReportValue[4] := FORMAT("Cost Amount (Expected)");
                                ReportValue[6] := ItemEntryTypeDescription[3];
                                ReportValue[7] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::"Positive Adjmt.".AsInteger(), true, false, false));
                                ReportValue[9] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::"Positive Adjmt.".AsInteger(), false, true, false));
                                ReportValue[10] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::"Positive Adjmt.".AsInteger(), false, false, true));
                                WriteCSV(ReportValue);
                                CLEAR(ReportValue);
                            end;
                            if EntriesExist(4) then begin
                                ReportValue[2] := EntryTypeDescription[4];
                                "Value Entry".SETRANGE("Entry Type", "Entry Type"::"Indirect Cost");
                                "Value Entry".CALCSUMS("Sales Amount (Actual)");
                                "Value Entry".CALCSUMS("Sales Amount (Expected)");
                                "Value Entry".CALCSUMS("Cost Amount (Actual)");
                                "Value Entry".CALCSUMS("Cost Amount (Expected)");
                                ReportValue[3] := FORMAT("Cost Amount (Actual)");
                                ReportValue[4] := FORMAT("Cost Amount (Expected)");
                                ReportValue[6] := ItemEntryTypeDescription[4];
                                ReportValue[7] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::"Negative Adjmt.".AsInteger(), true, false, false));
                                ReportValue[9] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::"Negative Adjmt.".AsInteger(), false, true, false));
                                ReportValue[10] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::"Negative Adjmt.".AsInteger(), false, false, true));
                                WriteCSV(ReportValue);
                                CLEAR(ReportValue);
                            end;
                            if EntriesExist(5) then begin
                                ReportValue[2] := EntryTypeDescription[5];
                                "Value Entry".SETRANGE("Entry Type", "Entry Type"::Variance);
                                "Value Entry".CALCSUMS("Sales Amount (Actual)");
                                "Value Entry".CALCSUMS("Sales Amount (Expected)");
                                "Value Entry".CALCSUMS("Cost Amount (Actual)");
                                "Value Entry".CALCSUMS("Cost Amount (Expected)");
                                ReportValue[3] := FORMAT("Cost Amount (Actual)");
                                ReportValue[4] := FORMAT("Cost Amount (Expected)");
                                ReportValue[6] := ItemEntryTypeDescription[5];
                                ReportValue[7] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Transfer.AsInteger(), true, false, false));
                                ReportValue[9] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Transfer.AsInteger(), false, true, false));
                                ReportValue[10] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Transfer.AsInteger(), false, false, true));
                                WriteCSV(ReportValue);
                                CLEAR(ReportValue);
                            end;
                            if EntriesExist(6) then begin
                                ReportValue[6] := ItemEntryTypeDescription[6];
                                ReportValue[7] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Consumption.AsInteger(), true, false, false));
                                ReportValue[9] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Consumption.AsInteger(), false, true, false));
                                ReportValue[10] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Consumption.AsInteger(), false, false, true));
                                WriteCSV(ReportValue);
                                CLEAR(ReportValue);
                            end;
                            if EntriesExist(7) then begin
                                ReportValue[6] := ItemEntryTypeDescription[7];
                                ReportValue[7] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Output.AsInteger(), true, false, false));
                                ReportValue[9] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Output.AsInteger(), false, true, false));
                                ReportValue[10] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::Output.AsInteger(), false, false, true));
                                WriteCSV(ReportValue);
                                CLEAR(ReportValue);
                            end;
                            if EntriesExist(8) then begin
                                ReportValue[6] := ItemEntryTypeDescription[8];
                                ReportValue[7] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::"Assembly Consumption".AsInteger(), true, false, false));
                                ReportValue[9] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::"Assembly Consumption".AsInteger(), false, true, false));
                                ReportValue[10] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::"Assembly Consumption".AsInteger(), false, false, true));
                                WriteCSV(ReportValue);
                                CLEAR(ReportValue);
                            end;
                            if EntriesExist(9) then begin
                                ReportValue[6] := ItemEntryTypeDescription[9];
                                ReportValue[7] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::"Assembly Output".AsInteger(), true, false, false));
                                ReportValue[9] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::"Assembly Output".AsInteger(), false, true, false));
                                ReportValue[10] := FORMAT(ItemLedgerEntryType("Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.", "Item Ledger Entry Type"::"Assembly Output".AsInteger(), false, false, true));
                                WriteCSV(ReportValue);
                                CLEAR(ReportValue);
                            end;
                            if EntriesExist(10) then begin
                                ReportValue[6] := ItemEntryTypeDescription[10];
                                ReportValue[7] := FORMAT(ItemEntryTypeTotalAmount[10]);
                                ReportValue[9] := FORMAT(ItemEntryTypeTotalCost[10]);
                                ReportValue[10] := FORMAT(ItemEntryTypeTotalCostExp[10]);
                                WriteCSV(ReportValue);
                                CLEAR(ReportValue);
                            end;
                            WriteCSV(ReportValue);
                            CLEAR(ReportValue);
                        end;
                    end;

                    if IncludeTextFile then begin
                        if CSVBool then begin
                            ValueEntry.SETRANGE("Entry No.", "Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.");
                            ValueEntry.CALCSUMS(ValueEntry."Sales Amount (Actual)");
                            ValueEntry.CALCSUMS(ValueEntry."Sales Amount (Expected)");
                            ValueEntry.CALCSUMS(ValueEntry."Cost Amount (Actual)");
                            ValueEntry.CALCSUMS(ValueEntry."Cost Amount (Expected)");
                            ReportValue[6] := TotalCaptionLbl;
                            ReportValue[7] := FORMAT(ValueEntry."Sales Amount (Actual)");
                            ReportValue[9] := FORMAT(ValueEntry."Cost Amount (Actual)");
                            ReportValue[10] := FORMAT(ValueEntry."Cost Amount (Expected)");
                            WriteCSV(ReportValue);
                            CLEAR(ReportValue);
                        end;
                    end;
                end;

                trigger OnPreDataItem();
                begin
                    Setrange("Inventory Posting Group", InventoryPostingGroup);
                    SETRANGE("Entry No.", "Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.");
                    CLEAR(ShowItemLineSummary[i]);

                    SetSectionsVisibility("Value Entry", 1);//Additional
                    Counter := 1;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                if IncludeTextFile then begin
                    if CSVBool then begin
                        ReportValue[1] := ItemRegisterNoCaptionLbl;
                        ReportValue[2] := FORMAT("Item Register"."No.");
                        WriteCSV(ReportValue);
                        CLEAR(ReportValue);
                    end;
                end;
            end;

            trigger OnPostDataItem();
            begin
                // Overall Totals
                if IncludeTextFile then begin
                    if not CSVBool then
                        exit;

                    ReportValue[1] := 'Total';
                    WriteCSV(ReportValue);
                    CLEAR(ReportValue);
                    if (EntriesExist(1)) then begin
                        ReportValue[2] := EntryTypeDescription[1];
                        ReportValue[3] := FORMAT(CostAmountActualDirectCost);
                        ReportValue[4] := FORMAT(CostAmountExpectDirectCost);
                        ReportValue[6] := ItemEntryTypeDescription[1];
                        ReportValue[7] := FORMAT(SalesAmountActualPurchase);
                        ReportValue[9] := FORMAT(CostAmountActualPurchase);
                        ReportValue[10] := FORMAT(CostAmountExpectPurchase);
                        WriteCSV(ReportValue);
                        CLEAR(ReportValue);
                    end;
                    if (EntriesExist(2)) then begin
                        ReportValue[2] := EntryTypeDescription[2];
                        ReportValue[3] := FORMAT(CostAmountActualRevaluation);
                        ReportValue[4] := FORMAT(CostAmountExpectRevaluation);
                        ReportValue[6] := ItemEntryTypeDescription[2];
                        ReportValue[7] := FORMAT(SalesAmountActualSale);
                        ReportValue[9] := FORMAT(CostAmountActualSale);
                        ReportValue[10] := FORMAT(CostAmountExpectSale);
                        WriteCSV(ReportValue);
                        CLEAR(ReportValue);
                    end;
                    if (EntriesExist(3)) then begin
                        ReportValue[2] := EntryTypeDescription[3];
                        ReportValue[3] := FORMAT(CostAmountActualRounding);
                        ReportValue[4] := FORMAT(CostAmountExpectRounding);
                        ReportValue[6] := ItemEntryTypeDescription[3];
                        ReportValue[7] := FORMAT(SalesAmountActualPosAdjmt);
                        ReportValue[9] := FORMAT(CostAmountActualPosAdjmt);
                        ReportValue[10] := FORMAT(CostAmountExpectPosAdjmt);
                        WriteCSV(ReportValue);
                        CLEAR(ReportValue);
                    end;
                    if (EntriesExist(4)) then begin
                        ReportValue[2] := EntryTypeDescription[4];
                        ReportValue[3] := FORMAT(CostAmountActualIndirectCost);
                        ReportValue[4] := FORMAT(CostAmountExpectIndirectCost);
                        ReportValue[6] := ItemEntryTypeDescription[4];
                        ReportValue[7] := FORMAT(SalesAmountActualNegAdjmt);
                        ReportValue[9] := FORMAT(CostAmountActualNegAdjmt);
                        ReportValue[10] := FORMAT(CostAmountExpectNegAdjmt);
                        WriteCSV(ReportValue);
                        CLEAR(ReportValue);
                    end;
                    if (EntriesExist(5)) then begin
                        ReportValue[2] := EntryTypeDescription[5];
                        ReportValue[3] := FORMAT(CostAmountActualVariance);
                        ReportValue[4] := FORMAT(CostAmountExpectVariance);
                        ReportValue[6] := ItemEntryTypeDescription[5];
                        ReportValue[7] := FORMAT(SalesAmountActualTransfer);
                        ReportValue[9] := FORMAT(CostAmountActualTransfer);
                        ReportValue[10] := FORMAT(CostAmountExpectTransfer);
                        WriteCSV(ReportValue);
                        CLEAR(ReportValue);
                    end;
                    if (EntriesExist(6)) then begin
                        ReportValue[6] := ItemEntryTypeDescription[6];
                        ReportValue[7] := FORMAT(SalesAmountActualConsumption);
                        ReportValue[9] := FORMAT(CostAmountActualConsumption);
                        ReportValue[10] := FORMAT(CostAmountExpectConsumption);
                        WriteCSV(ReportValue);
                        CLEAR(ReportValue);
                    end;
                    if (EntriesExist(7)) then begin
                        ReportValue[6] := ItemEntryTypeDescription[7];
                        ReportValue[7] := FORMAT(SalesAmountActualOutput);
                        ReportValue[9] := FORMAT(CostAmountActualOutput);
                        ReportValue[10] := FORMAT(CostAmountExpectOutput);
                        WriteCSV(ReportValue);
                        CLEAR(ReportValue);
                    end;
                    if (EntriesExist(8)) then begin
                        ReportValue[6] := ItemEntryTypeDescription[8];
                        ReportValue[7] := FORMAT(SalesAmountActualAssConsumption);
                        ReportValue[9] := FORMAT(CostAmountActualAssConsumption);
                        ReportValue[10] := FORMAT(CostAmountExpectAssConsumption);
                        WriteCSV(ReportValue);
                        CLEAR(ReportValue);
                    end;
                    if (EntriesExist(9)) then begin
                        ReportValue[6] := ItemEntryTypeDescription[9];
                        ReportValue[7] := FORMAT(SalesAmountActualAssOutput);
                        ReportValue[9] := FORMAT(CostAmountActualAssOutput);
                        ReportValue[10] := FORMAT(CostAmountExpectAssOutput);
                        WriteCSV(ReportValue);
                        CLEAR(ReportValue);
                    end;
                    if (EntriesExist(10)) then begin
                        ReportValue[6] := ItemEntryTypeDescription[10];
                        ReportValue[7] := FORMAT(ItemEntryTypeTotalAmount[10]);
                        ReportValue[9] := FORMAT(ItemEntryTypeTotalCost[10]);
                        ReportValue[10] := FORMAT(ItemEntryTypeTotalCostExp[10]);
                        WriteCSV(ReportValue);
                        CLEAR(ReportValue);
                    end;
                    WriteCSV(ReportValue);
                    CLEAR(ReportValue);

                    ReportValue[6] := TotalCaptionLbl;
                    ReportValue[7] := FORMAT(SalesAmountActual);
                    ReportValue[9] := FORMAT(CostAmountActual);
                    ReportValue[10] := FORMAT(CostAmountExpected);
                    WriteCSV(ReportValue);
                    CLEAR(ReportValue);

                    //paul
                end;
            end;

            trigger OnPreDataItem();
            var
            //FileClass: Codeunit File_Class_PHL;

            begin
                if findset then
                    repeat
                        ValueEntry.RESET;
                        ValueEntry.SETRANGE("Entry No.", "Item Register"."From Value Entry No.", "Item Register"."To Value Entry No.");
                        SetSectionsVisibility(ValueEntry, 2);
                    until NEXT = 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Option)
                {
                    Caption = 'Option';

                    field(InventoryPostingGroup; InventoryPostingGroup)
                    {
                        Caption = 'Inventory Posting Group';
                        ApplicationArea = All;
                        TableRelation = "Inventory Posting Group";
                    }
                    field(IncludeCSV; IncludeTextFile)
                    {
                        Caption = 'Include Text File';
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            if not IncludeTextFile then begin
                                CSVBool := false;
                                TextBool := false;
                            end else begin
                                CSVBool := true;
                                TextBool := false;
                            end;
                        end;
                    }
                    field(CSVBool; CSVBool)
                    {
                        Caption = 'CSV Format';
                        ApplicationArea = All;
                        Editable = IncludeTextFile;
                        Enabled = IncludeTextFile;

                        trigger OnValidate()
                        begin
                            if CSVBool then
                                TextBool := false;
                        end;
                    }
                    field(TextBool; TextBool)
                    {
                        Caption = 'Txt Format';
                        ApplicationArea = All;
                        Editable = IncludeTextFile;
                        Enabled = IncludeTextFile;

                        trigger OnValidate()
                        begin
                            if TextBool then
                                CSVBool := false;
                        end;
                    }
                    field(IncludeExpectedCost; ShowExpected)
                    {
                        ApplicationArea = All;
                        Caption = 'Include Expected Cost';
                        ToolTip = 'Specifies if you want the report to also show entries that only have expected costs.';
                    }
                }
            }
        }

        actions
        {
        }
    }
    /*
    rendering
    {
        layout(BMGItemRegister)
        {
            Caption = 'BMG Item Register';
            Type = RDLC;
            LayoutFile = 'Reports\Layout\BMGItemRegister.rdl';
        }
    }
    */

    labels
    {
    }

    trigger OnInitReport();
    var
    //LicenseMgmt: Codeunit LicenseMgmt_PHL;
    begin
        // License Management
        //LicenseMgmt.PromptErrorIfLicenseInvalid();

        CompanyInfo.GET;
        FormatAddr.Company(CompanyAddr, CompanyInfo);
        InventoryPostingGroup := 'FORSALE|CONSUMABLES';
    end;

    trigger OnPostReport();
    var
    //FileClass: Codeunit File_Class_PHL;
    begin
        if IncludeTextFile then begin
            if CSVBool then begin
                WriteCSV(ReportValue);
                CLEAR(ReportValue);

                WriteCSV(ReportValue);
                CLEAR(ReportValue);

                ReportValue[1] := CompanyInfoBIRPermitNoCaption;
                ReportValue[2] := CompanyInfo."BIR Permit No. PHL";
                WriteCSV(ReportValue);
                CLEAR(ReportValue);

                ReportValue[1] := CompanyInfoDateIssuedCaption;
                ReportValue[2] := FORMAT(CompanyInfo."Date Issued PHL");
                WriteCSV(ReportValue);
                CLEAR(ReportValue);

                ReportValue[1] := CompanyInfo.FieldCaption("Application Name PHL");
                ReportValue[2] := CompanyInfo."Application Name PHL";
                WriteCSV(ReportValue);
                CLEAR(ReportValue);

                ReportValue[1] := CompanyInfo.FieldCaption("Application Version No. PHL");
                ReportValue[2] := CompanyInfo."Application Version No. PHL";
                WriteCSV(ReportValue);
                CLEAR(ReportValue);
            end;
        end;

        if IncludeTextFile then
            if CSVBool then
                DownloadFile(TempBlob, StrSubstNo(FileName, Format(Today(), 0, '<Year4>'), 'csv'))
            else
                DownloadFile(TempBlob, StrSubstNo(FileName, Format(Today(), 0, '<Year4>'), 'txt'));
    end;

    trigger OnPreReport();
    begin
        ItemRegFilter := "Item Register".GETFILTERS;
        for i := 1 to ARRAYLEN(ItemEntryTypeDescription) do begin
            evaluate("Value Entry"."Item Ledger Entry Type", format(i - 1));
            ItemEntryTypeDescription[i] := FORMAT("Value Entry"."Item Ledger Entry Type");
        end;

        for i := 1 to ARRAYLEN(EntryTypeDescription) do begin
            evaluate("Value Entry"."Entry Type", format(i - 1));
            EntryTypeDescription[i] := FORMAT("Value Entry"."Entry Type");
        end;

        IncludeTextFile := (not CurrReport.PREVIEW) and IncludeTextFile;

        if IncludeTextFile then begin
            CLEAR(TempBlob);
            Tempblob.CreateOutStream(FileOutStream);

            if CSVBool then
                WriteCSVHeader()
            else
                WriteHeaderText();
        end;
    end;

    var
        Item: Record Item;
        CompanyInfo: Record "Company Information";
        ValueEntry: Record "Value Entry";
        ItemRegFilter: Text[250];
        ItemDescription: Text[100];
        i: Integer;
        UnitAmount: Decimal;
        ItemEntryTypeDescription: array[10] of Text;
        ItemEntryTypeTotalAmount: array[10] of Decimal;
        ItemEntryTypeTotalCost: array[10] of Decimal;
        ItemEntryTypeTotalCostExp: array[10] of Decimal;
        EntryTypeDescription: array[5] of Text;
        EntryTypeTotalCost: array[5] of Decimal;
        EntryTypeTotalCostExp: array[5] of Decimal;
        ShowItemLineSummary: array[10] of Boolean;
        ShowTotalLineSummary: array[10] of Boolean;
        ItemRegisterValueCaptionLbl: Label 'Item Register - Value';
        CurrReportPageNoCaptionLbl: Label 'Page';
        ValEntyItmLedgEntyTypCptnLbl: Label 'Item Ledger Entry Type';
        ItemDescriptionCaptionLbl: Label 'Description';
        ValueEntrySalesAmtActCptnLbl: Label 'Amount';
        UnitAmountCaptionLbl: Label 'Unit Amount';
        ItemRegisterNoCaptionLbl: Label 'Register No.';
        TotalCaptionLbl: Label 'Total';
        CompanyInfoBIRPermitNoCaption: Label 'BIR Permit No.';
        CompanyInfoDateIssuedCaption: Label 'Date Issued';
        IncludeTextFile: Boolean;
        CSVBool: Boolean;
        TextBool: Boolean;
        TempBlob: Codeunit "Temp Blob";
        FileOutStream: OutStream;
        ReportValue: array[13] of Text[250];
        FileName: Label 'Inventory Book %1.%2';
        ItemEntryTypeNoOfEntries: array[10] of Decimal;
        EntryTypeNoOfEntries: array[10] of Decimal;
        IsEntriesExist1: array[2] of Boolean;
        IsEntriesExist2: array[2] of Boolean;
        IsEntriesExist3: array[2] of Boolean;
        IsEntriesExist4: array[2] of Boolean;
        IsEntriesExist6: array[2] of Boolean;
        IsEntriesExist7: array[2] of Boolean;
        IsEntriesExist8: array[2] of Boolean;
        IsEntriesExist9: array[2] of Boolean;
        IsEntriesExist10: array[2] of Boolean;
        SalesAmountActual: Decimal;
        SalesAmountExpected: Decimal;
        CostAmountActual: Decimal;
        CostAmountExpected: Decimal;
        CostAmountActualDirectCost: Decimal;
        CostAmountActualRevaluation: Decimal;
        CostAmountActualRounding: Decimal;
        CostAmountActualIndirectCost: Decimal;
        CostAmountActualVariance: Decimal;
        CostAmountExpectDirectCost: Decimal;
        CostAmountExpectRevaluation: Decimal;
        CostAmountExpectRounding: Decimal;
        CostAmountExpectIndirectCost: Decimal;
        CostAmountExpectVariance: Decimal;
        CostAmountActualPurchase: Decimal;
        CostAmountActualSale: Decimal;
        CostAmountActualPosAdjmt: Decimal;
        CostAmountActualNegAdjmt: Decimal;
        CostAmountActualTransfer: Decimal;
        CostAmountActualConsumption: Decimal;
        CostAmountActualOutput: Decimal;
        CostAmountActualAssConsumption: Decimal;
        CostAmountActualAssOutput: Decimal;
        CostAmountExpectPurchase: Decimal;
        CostAmountExpectSale: Decimal;
        CostAmountExpectPosAdjmt: Decimal;
        CostAmountExpectNegAdjmt: Decimal;
        CostAmountExpectTransfer: Decimal;
        CostAmountExpectConsumption: Decimal;
        CostAmountExpectOutput: Decimal;
        CostAmountExpectAssConsumption: Decimal;
        CostAmountExpectAssOutput: Decimal;
        SalesAmountActualPurchase: Decimal;
        SalesAmountActualSale: Decimal;
        SalesAmountActualPosAdjmt: Decimal;
        SalesAmountActualNegAdjmt: Decimal;
        SalesAmountActualTransfer: Decimal;
        SalesAmountActualConsumption: Decimal;
        SalesAmountActualOutput: Decimal;
        SalesAmountActualAssConsumption: Decimal;
        SalesAmountActualAssOutput: Decimal;
        Counter: Integer;
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[50];
        _TotalCostAmount: Decimal;
        _TotalRecords: Integer;
        InventoryPostingGroup: Text;
        ShowExpected: Boolean;

    procedure WriteCSV(LocString: array[13] of Text[250]);
    var
        ArrayCtr: Integer;
        TextToWrite: Text;
    begin
        for ArrayCtr := 1 to 13 do begin
            TextToWrite += ApplyQuote(FORMAT(LocString[ArrayCtr])) + ','
        end;
        TextToWrite := DELSTR(TextToWrite, STRLEN(TextToWrite), 1);
        FileOutStream.WriteText(TextToWrite);
        FileOutStream.WriteText(); // CR + LF
        CLEAR(LocString)
    end;

    procedure ApplyQuote(LocString: Text[250]): Text[250];
    var
        CharCtr: Integer;
        ApplyQuote: Boolean;
    begin
        ApplyQuote := false;
        for CharCtr := 1 to STRLEN(LocString) do begin
            if LocString[CharCtr] = ',' then begin
                exit('"' + LocString + '"');
            end;
        end;

        exit(LocString);
    end;

    procedure EntriesExist(i: Integer): Boolean;
    begin

        if i <= 5 then
            exit((ItemEntryTypeNoOfEntries[i] > 0) or (EntryTypeNoOfEntries[i] > 0))
        else
            exit(ItemEntryTypeNoOfEntries[i] > 0);
    end;

    procedure SetSectionsVisibility(var ValueEntry: Record "Value Entry"; DimNum: Integer);
    begin
        if not ValueEntry.FIND('-') then
            exit;

        repeat
            ItemEntryTypeNoOfEntries[ValueEntry."Item Ledger Entry Type".AsInteger() + 1] := 1;
            EntryTypeNoOfEntries[ValueEntry."Entry Type".AsInteger() + 1] := 1;
        until ValueEntry.NEXT = 0;

        IsEntriesExist1[DimNum] := EntriesExist(1);
        IsEntriesExist2[DimNum] := EntriesExist(2);
        IsEntriesExist3[DimNum] := EntriesExist(3);
        IsEntriesExist4[DimNum] := EntriesExist(4);
        IsEntriesExist6[DimNum] := EntriesExist(6);
        IsEntriesExist7[DimNum] := EntriesExist(7);
        IsEntriesExist8[DimNum] := EntriesExist(8);
        IsEntriesExist9[DimNum] := EntriesExist(9);
        IsEntriesExist10[DimNum] := EntriesExist(10);
    end;

    procedure ItemLedgerEntryType(FromValEntryNo: Integer; ToValEntryNo: Integer; Type: Option Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output,"Assembly Consumption","Assembly Output"; SalesAmt: Boolean; CostAmtAct: Boolean; CostAmtExp: Boolean): Decimal;
    var
        ValEntry: Record "Value Entry";
        ValEntry2: Record "Value Entry";
        SalesAmountActual: Decimal;
        SalesAmountExpected: Decimal;
        CostAmountActual: Decimal;
        CostAmountExpected: Decimal;
    begin
        ValEntry.SETRANGE("Entry No.", FromValEntryNo, ToValEntryNo);
        if Type = Type::Purchase then begin
            ValEntry.SETRANGE("Item Ledger Entry Type", ValEntry."Item Ledger Entry Type"::Purchase);
        end else
            if Type = Type::Sale then begin
                ValEntry.SETRANGE("Item Ledger Entry Type", ValEntry."Item Ledger Entry Type"::Sale);
            end else
                if Type = Type::"Positive Adjmt." then begin
                    ValEntry.SETRANGE("Item Ledger Entry Type", ValEntry."Item Ledger Entry Type"::"Positive Adjmt.");
                end else
                    if Type = Type::"Negative Adjmt." then begin
                        ValEntry.SETRANGE("Item Ledger Entry Type", ValEntry."Item Ledger Entry Type"::"Negative Adjmt.");
                    end else
                        if Type = Type::Transfer then begin
                            ValEntry.SETRANGE("Item Ledger Entry Type", ValEntry."Item Ledger Entry Type"::Transfer);
                        end else
                            if Type = Type::Consumption then begin
                                ValEntry.SETRANGE("Item Ledger Entry Type", ValEntry."Item Ledger Entry Type"::Consumption);
                            end else
                                if Type = Type::Output then begin
                                    ValEntry.SETRANGE("Item Ledger Entry Type", ValEntry."Item Ledger Entry Type"::Output);
                                end else
                                    if Type = Type::"Assembly Consumption" then begin
                                        ValEntry.SETRANGE("Item Ledger Entry Type", ValEntry."Item Ledger Entry Type"::"Assembly Consumption");
                                    end else
                                        if Type = Type::"Assembly Output" then begin
                                            ValEntry.SETRANGE("Item Ledger Entry Type", ValEntry."Item Ledger Entry Type"::"Assembly Output");
                                        end;
        if ValEntry.FINDSET then begin
            repeat
                if not ShowExpected then
                    SalesAmountActual += ValEntry."Sales Amount (Actual)";
                if ShowExpected then
                    SalesAmountActual += ValEntry."Sales Amount (Actual)" + ValEntry."Sales Amount (Expected)";
                SalesAmountExpected += ValEntry."Sales Amount (Expected)";
                CostAmountActual += ValEntry."Cost Amount (Actual)";
                CostAmountExpected += ValEntry."Cost Amount (Expected)";
            until ValEntry.NEXT = 0;
        end;
        if SalesAmt then begin
            if not ShowExpected then
                exit(SalesAmountActual);
            if ShowExpected then
                exit(SalesAmountActual + SalesAmountExpected);
        end else
            if CostAmtAct then begin
                exit(CostAmountActual);
            end else
                if CostAmtExp then begin
                    exit(CostAmountExpected);
                end;
    end;

    local procedure DownloadFile(var TempBlob: Codeunit "Temp Blob"; pFileName: Text)
    var
        FileInStream: InStream;
    begin
        TempBlob.CreateInStream(FileInStream);
        DOWNLOADFROMSTREAM(FileInStream, 'Export', '', 'All Files (*.*)|*.*', pFileName);
    end;

    local procedure GetTotal()
    var
        lItemRegister: Record "Item Register";
        lValueEntry: Record "Value Entry";
    begin
        if "Item Register".GetFilters <> '' then begin
            lItemRegister.SetLoadFields("From Entry No.", "To Entry No.");
            lItemRegister.CopyFilters("Item Register");
            if lItemRegister.FindSet() then
                repeat
                    lValueEntry.SetLoadFields("Cost Amount (Actual)");
                    lValueEntry.CopyFilters("Value Entry");
                    lValueEntry.SetRange("Entry No.", lItemRegister."From Capacity Entry No.", lItemRegister."To Entry No.");
                    if lValueEntry.FindSet() then
                        repeat
                            _TotalCostAmount += lValueEntry."Cost Amount (Actual)";
                            _TotalRecords += 1;
                        until lValueEntry.Next() = 0;
                until lItemRegister.Next() = 0;
        end else begin
            if "Value Entry".GetFilters() = '' then
                Error('You have to specify filter on Value Entry Table.');

            lValueEntry.SetLoadFields("Cost Amount (Actual)");
            lValueEntry.CopyFilters("Value Entry");
            if lValueEntry.FindSet() then
                repeat
                    _TotalCostAmount += lValueEntry."Cost Amount (Actual)";
                    _TotalRecords += 1;
                until lValueEntry.Next() = 0;
        end;


        lItemRegister.CopyFilters("Item Register");
        lValueEntry.CopyFilters("Value Entry");
        if lItemRegister.FindSet() then
            repeat
                lValueEntry.SetLoadFields("Cost Amount (Actual)");
                lValueEntry.SETRANGE("Entry No.", lItemRegister."From Entry No.", lItemRegister."To Entry No.");
                if lValueEntry.FindSet() then
                    repeat

                    until lValueEntry.Next() = 0;
            until lItemRegister.Next() = 0;
    end;


    local procedure WriteText(TextToWrite: Text)
    var
    begin
        FileOutStream.WriteText(TextToWrite);
        FileOutStream.WriteText(); // CR + LF
    end;

    local procedure WriteHeaderText()
    begin
        GetTotal();

        WriteText('TAXPAYER''S NAME: ' + CompanyInfo.Name);
        CLEAR(ReportValue);

        WriteText('TIN: ' + CompanyInfo."VAT Registration No.");
        CLEAR(ReportValue);

        WriteText('ADDRESS: ' + CompanyInfo.Address + ' ' + CompanyInfo."Address 2" + ' ' + CompanyInfo.City);
        CLEAR(ReportValue);

        WriteText('');
        CLEAR(ReportValue);

        WriteText('Software: ' + CompanyInfo."Application Name PHL" + ' Version ' + CompanyInfo."Application Version No. PHL");
        CLEAR(ReportValue);

        WriteText('Acknowledgement Certificate Control No.: ' + CompanyInfo."BIR Permit No. PHL");
        CLEAR(ReportValue);

        WriteText('Date Issued: ' + format(CompanyInfo."Date Issued PHL"));
        CLEAR(ReportValue);

        WriteText('');
        CLEAR(ReportValue);

        WriteText('Accounting Books File Attributes/Layout Definition');
        CLEAR(ReportValue);

        WriteText('File Name: ' + 'Inventory Book ' + Format(Today(), 0, '<Year4>'));
        CLEAR(ReportValue);

        WriteText('File Type: ' + 'Text File');
        CLEAR(ReportValue);

        WriteText('Number of Records: ' + Format(_TotalRecords));
        CLEAR(ReportValue);

        WriteText('Cost Amount (Actual) Control Total: ' + Format(_TotalCostAmount));
        CLEAR(ReportValue);

        WriteText('Period Covered: ' + Format("Value Entry".GetRangeMin("Posting Date"), 0, '<Month Text> <Day,2>,') + ' to ' + Format("Value Entry".GetRangeMax("Posting Date"), 0, '<Month Text> <Day,2>, <Year4>'));
        CLEAR(ReportValue);

        WriteText('Transaction Cut-off Date & Time: ' + Format(20231231D, 0, '<Month Text> <Day,2>, <Year4>') + ' ' + Format(115900T, 0, '<Hours12>:<Minutes,2>:<Seconds,2> <AM/PM>'));
        CLEAR(ReportValue);

        WriteText('Extracted by: ' + FORMAT(USERID));
        CLEAR(ReportValue);

        WriteText('');
        CLEAR(ReportValue);

        WriteText('File Layout: ');
        CLEAR(ReportValue);

        WriteText('Field Name             ' + 'From  ' + 'To   ' + 'Length');
        CLEAR(ReportValue);

        WriteText('Date                   ' + '1     ' + '8    ' + '8     ');
        CLEAR(ReportValue);

        WriteText('Entry Type             ' + '11    ' + '25   ' + '15    ');
        CLEAR(ReportValue);

        WriteText('Item No.               ' + '27    ' + '47   ' + '20    ');
        CLEAR(ReportValue);

        WriteText('Description            ' + '49    ' + '99   ' + '50    ');
        CLEAR(ReportValue);

        WriteText('Invoice Quantity       ' + '101   ' + '116  ' + '15    ');
        CLEAR(ReportValue);

        WriteText('Unit Amount            ' + '118   ' + '133  ' + '15   ');
        CLEAR(ReportValue);

        WriteText('Sales Amount (Actual)  ' + '135   ' + '150  ' + '15   ');
        CLEAR(ReportValue);

        WriteText('Cost per Unit          ' + '152   ' + '167  ' + '15   ');
        CLEAR(ReportValue);

        WriteText('Cost Amount (Actual)   ' + '169   ' + '184  ' + '15   ');
        CLEAR(ReportValue);

        WriteText('Cost Amount (Expected) ' + '186   ' + '201  ' + '15   ');
        CLEAR(ReportValue);

        WriteText('Item Ledger Entry Type ' + '203   ' + '223  ' + '20   ');
        CLEAR(ReportValue);

        WriteText('Entry No.              ' + '225   ' + '235  ' + '10   ');
        CLEAR(ReportValue);

        WriteText('Item Ledger Entry No.  ' + '237   ' + '256  ' + '10   ');
        CLEAR(ReportValue);

        WriteText('');
        CLEAR(ReportValue);
    end;

    local procedure WriteCSVHeader()
    begin
        ReportValue[1] := 'TAXPAYER''S NAME';
        ReportValue[2] := CompanyInfo.Name;
        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        ReportValue[1] := 'TIN';
        ReportValue[2] := CompanyInfo."VAT Registration No.";
        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        ReportValue[1] := 'ADDRESS';
        ReportValue[2] := CompanyInfo.Address + ' ' + CompanyInfo."Address 2";
        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        ReportValue[1] := '';
        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        ReportValue[1] := 'Software';
        ReportValue[2] := CompanyInfo."Application Name PHL" + 'Version ' + CompanyInfo."Application Version No. PHL";
        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        ReportValue[1] := 'Acknowledgement Certificate Control No.';
        ReportValue[2] := CompanyInfo."BIR Permit No. PHL";
        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        ReportValue[1] := 'File Name';
        ReportValue[2] := 'Item Register - Value';
        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        ReportValue[1] := 'File Type';
        if CSVBool then
            ReportValue[2] := 'Csv File'
        else
            ReportValue[2] := 'Text File';

        ReportValue[1] := 'Number of Records';
        ReportValue[2] := Format(_TotalRecords);
        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        ReportValue[1] := 'Fax No.';
        ReportValue[2] := CompanyInfo."Fax No.";
        ReportValue[13] := CompanyInfo."Application Version No. PHL";
        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        ReportValue[1] := 'Email';
        ReportValue[2] := CompanyInfo."E-Mail";
        ReportValue[13] := CompanyInfo."BIR Serial No. PHL";
        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        ReportValue[1] := 'VAT Reg. TIN';
        ReportValue[2] := CompanyInfo."VAT Registration No.";
        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        ReportValue[1] := ItemRegisterValueCaptionLbl;
        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        ReportValue[1] := 'Item Register' + ': ';
        ReportValue[2] := ItemRegFilter;
        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        WriteCSV(ReportValue);
        CLEAR(ReportValue);

        ReportValue[1] := "Value Entry".FIELDCAPTION("Posting Date");
        ReportValue[2] := "Value Entry".FIELDCAPTION("Entry Type");
        ReportValue[3] := "Value Entry".FIELDCAPTION("Item No.");
        ReportValue[4] := ItemDescriptionCaptionLbl;
        ReportValue[5] := "Value Entry".FIELDCAPTION("Invoiced Quantity");
        ReportValue[6] := UnitAmountCaptionLbl;
        ReportValue[7] := ValueEntrySalesAmtActCptnLbl;
        ReportValue[8] := "Value Entry".FIELDCAPTION("Cost per Unit");
        ReportValue[9] := "Value Entry".FIELDCAPTION("Cost Amount (Actual)");
        ReportValue[10] := "Value Entry".FIELDCAPTION("Cost Amount (Expected)");
        ReportValue[11] := ValEntyItmLedgEntyTypCptnLbl;
        ReportValue[12] := "Value Entry".FIELDCAPTION("Entry No.");
        ReportValue[13] := "Value Entry".FIELDCAPTION("Item Ledger Entry No.");
        WriteCSV(ReportValue);
        CLEAR(ReportValue);
    end;

    local procedure WriteTextLine(pDate: Text[8];
                            pEntryType: Text[15];
                            pItemNo: Text[20];
                            pDescription: Text[50];
                            pInvoiceQty: Text[15];
                            pUnitAmount: Text[15];
                            pSalesAmtActual: Text[15];
                            pCostperUnit: Text[15];
                            pCostAmtActual: text[15];
                            pCostAmtExpected: Text[15];
                            pItemLedgerEntryType: Text[20];
                            pEntryNo: Text[10];
                            pItemLedgerEntryNo: Text[10]) rLineText: Text
    var
        TxtBuilder: TextBuilder;
    begin
        TxtBuilder.Append(pDate);
        TxtBuilder.Append('  ');
        TxtBuilder.Append(pEntryType.PadRight(15, '0'));
        TxtBuilder.Append(' ');
        TxtBuilder.Append(pItemNo.PadRight(20, ' '));
        TxtBuilder.Append(' ');
        TxtBuilder.Append(pDescription.PadRight(50, ' '));
        TxtBuilder.Append(' ');
        TxtBuilder.Append(pInvoiceQty.PadRight(15, ' '));
        TxtBuilder.Append(' ');
        TxtBuilder.Append(pUnitAmount.PadRight(15, ' '));
        TxtBuilder.Append(' ');
        TxtBuilder.Append(pSalesAmtActual.PadRight(15, ' '));
        TxtBuilder.Append(' ');
        TxtBuilder.Append(pCostperUnit.PadRight(15, ' '));
        TxtBuilder.Append(' ');
        TxtBuilder.Append(pCostAmtActual.PadRight(15, ' '));
        TxtBuilder.Append(' ');
        TxtBuilder.Append(pCostAmtExpected.PadRight(15, ' '));
        TxtBuilder.Append(' ');
        TxtBuilder.Append(pItemLedgerEntryType.PadRight(20, ' '));
        TxtBuilder.Append(' ');
        TxtBuilder.Append(pEntryNo.PadRight(10, ' '));
        TxtBuilder.Append(' ');
        TxtBuilder.Append(pItemLedgerEntryNo.PadRight(10, ' '));
        rLineText := TxtBuilder.ToText();
    end;

    local procedure WriteTextLine()
    begin
        If NOT ShowExpected then begin
            WriteText(WriteTextLine(FORMAT("Value Entry"."Posting Date", 0, '<Year4><Month,2><Day,2>'),
                                    TrimText(15, FORMAT("Value Entry"."Entry Type")),
                                    TrimText(20, FORMAT("Value Entry"."Item No.")),
                                    TrimText(50, ItemDescription.Trim()),
                                    TrimText(15, FORMAT("Value Entry"."Invoiced Quantity")),
                                    TrimText(15, FORMAT(UnitAmount)),
                                    TrimText(15, FORMAT("Value Entry"."Sales Amount (Actual)")),
                                    TrimText(15, FORMAT("Value Entry"."Cost per Unit")),
                                    TrimText(15, FORMAT("Value Entry"."Cost Amount (Actual)")),
                                    TrimText(15, FORMAT("Value Entry"."Cost Amount (Expected)")),
                                    TrimText(20, FORMAT("Value Entry"."Item Ledger Entry Type")),
                                    TrimText(10, FORMAT("Value Entry"."Entry No.")),
                                    TrimText(10, FORMAT("Value Entry"."Item Ledger Entry No."))));
        end;

        if ShowExpected then begin
            WriteText(WriteTextLine(FORMAT("Value Entry"."Posting Date", 0, '<Year4><Month,2><Day,2>'),
                                    TrimText(15, FORMAT("Value Entry"."Entry Type")),
                                    TrimText(20, FORMAT("Value Entry"."Item No.")),
                                    TrimText(50, ItemDescription.Trim()),
                                    TrimText(15, FORMAT("Value Entry"."Invoiced Quantity")),
                                    TrimText(15, FORMAT(UnitAmount)),
                                    TrimText(15, FORMAT("Value Entry"."Sales Amount (Actual)" + "Value Entry"."Sales Amount (Expected)")),
                                    TrimText(15, FORMAT("Value Entry"."Cost per Unit")),
                                    TrimText(15, FORMAT("Value Entry"."Cost Amount (Actual)")),
                                    TrimText(15, FORMAT("Value Entry"."Cost Amount (Expected)")),
                                    TrimText(20, FORMAT("Value Entry"."Item Ledger Entry Type")),
                                    TrimText(10, FORMAT("Value Entry"."Entry No.")),
                                    TrimText(10, FORMAT("Value Entry"."Item Ledger Entry No."))));
        end;
    end;

    local procedure TrimText(MaxLength: Integer; TextValue: Text) NewText: Text
    begin
        NewText := TextValue;
        if StrLen(TextValue) > MaxLength then
            NewText := CopyStr(TextValue, 1, MaxLength);
    end;
}

