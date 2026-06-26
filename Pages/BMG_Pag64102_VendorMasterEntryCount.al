page 64102 BMGVendorMasterEntryCount
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = BMGVendorMasterEntryCount;
    Caption = 'Vendor Master Entry Count';
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field("Entry Count"; Rec."Entry Count")
                {
                    ApplicationArea = All;
                }
                field("Purch. Order Count"; Rec."Purch. Order Count")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Purch. Invoice Count"; Rec."Purch. Invoice Count")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Vendor Exist"; Rec."Vendor Exist")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetEntryCounts)
            {
                ApplicationArea = All;
                Caption = 'Get Entry Counts';
                Image = RefreshLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Reset();
                    if Rec.FindSet() then
                        repeat
                            Rec."Entry Count" := GetVendorLedgerEntryCount(Rec."Vendor No.");
                            Rec."Purch. Order Count" := GetPurchaseOrderCount(Rec."Vendor No.");
                            Rec."Purch. Invoice Count" := GetPurchaseInvoiceCount(Rec."Vendor No.");
                            Rec."Vendor Exist" := CheckVendorExists(Rec."Vendor No.");
                            Rec.Modify();
                        until Rec.Next() = 0;

                    CurrPage.Update(false);
                    Message('Entry counts updated successfully.');
                end;

            }
        }
    }


    local procedure GetPurchaseOrderCount(VendorNo: Code[20]): Integer
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::Order);
        PurchaseHeader.SetRange("Buy-from Vendor No.", VendorNo);
        exit(PurchaseHeader.Count());
    end;

    local procedure GetPurchaseInvoiceCount(VendorNo: Code[20]): Integer
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::Invoice);
        PurchaseHeader.SetRange("Buy-from Vendor No.", VendorNo);
        exit(PurchaseHeader.Count());
    end;

    local procedure CheckVendorExists(VendorNo: Code[20]): Boolean
    var
        Vendor: Record Vendor;
    begin
        exit(Vendor.Get(VendorNo));
    end;

    local procedure GetVendorLedgerEntryCount(VendorNo: Code[20]): Integer
    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
    begin
        VendorLedgerEntry.SetRange("Vendor No.", VendorNo);
        exit(VendorLedgerEntry.Count());
    end;
}
