page 64104 BMGItemLedger2Ext
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BMGItemLedgEntryExt;
    Caption = 'Item Ledger Entry Ext.';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Invoice No."; Rec."Sales Invoice No.")
                {
                    ApplicationArea = All;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
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
            action(DeleteAllEntries)
            {
                ApplicationArea = All;
                Caption = 'Delete All Entries';
                Image = DeleteAllBreakpoints;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ItemLedgEntryExt: Record BMGItemLedgEntryExt;
                begin
                    if not Confirm('Are you sure you want to delete ALL entries? This cannot be undone.', false) then
                        exit;

                    ItemLedgEntryExt.DeleteAll(true);
                    CurrPage.Update(false);
                    Message('All entries have been deleted.');
                end;
            }
        }
    }
}
