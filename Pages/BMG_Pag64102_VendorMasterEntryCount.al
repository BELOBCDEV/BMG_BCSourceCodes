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
                var
                    Vendor: Record Vendor;
                    VendorLedgerEntry: Record "Vendor Ledger Entry";
                    EntryCount: Record BMGVendorMasterEntryCount;
                begin

                    Rec.Reset();
                    if Rec.FindFirst() then
                        repeat
                            VendorLedgerEntry.Reset();
                            VendorLedgerEntry.SetRange("Vendor No.", Rec."Vendor No.");

                            if VendorLedgerEntry.FindSet() then begin
                                Rec."Entry Count" := VendorLedgerEntry.Count();
                                Rec.Modify();
                            end;

                        until Rec.Next() = 0;
                    /*
                    EntryCount.DeleteAll();

                    if Vendor.FindSet() then
                        repeat
                            VendorLedgerEntry.SetRange("Vendor No.", Vendor."No.");

                            EntryCount.Init();
                            EntryCount."Vendor No." := Vendor."No.";
                            EntryCount."Vendor Name" := Vendor.Name;
                            EntryCount."Entry Count" := VendorLedgerEntry.Count();
                            EntryCount.Insert();
                        until Vendor.Next() = 0;
                    */
                    CurrPage.Update(false);
                    Message('Entry counts updated successfully.');
                end;
            }
        }
    }
}
