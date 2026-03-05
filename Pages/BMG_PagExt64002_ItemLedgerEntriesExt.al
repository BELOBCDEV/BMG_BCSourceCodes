pageextension 64002 ItemLedgerEntriesExt extends "Item Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addbefore("Unit of Measure Code")
        {
            field(BaseUOM; codBaseUOM)
            {
                Caption = 'Base Unit of Measure';
                ApplicationArea = All;
            }
        }
        addafter("Unit of Measure Code")
        {
            field(PurchUOM; codPurchUOM)
            {
                Caption = 'Purch. Unit of Measure';
                ApplicationArea = All;
            }
        }
        addafter("Entry No.")
        {
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                ApplicationArea = All;
            }
        }

    }

    trigger OnAfterGetRecord()
    begin
        recItem.Reset();
        recItem.SetRange("No.", Rec."Item No.");

        codBaseUOM := '';

        if recItem.FindFirst() then begin
            codBaseUOM := recItem."Base Unit of Measure";
            codPurchUOM := recItem."Purch. Unit of Measure";
        end;
    end;



    var
        myInt: Integer;
        codBaseUOM: Code[10];
        codPurchUOM: Code[10];
        recItem: Record Item;
}