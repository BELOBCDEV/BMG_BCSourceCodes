pageextension 64006 BMGWhsePhysInvtJournalExt extends "Whse. Phys. Invt. Journal"
{
    layout
    {
        // Add changes to page layout here
        addbefore("Unit of Measure Code")
        {
            field(BMGUOM; codBaseUOM)
            {
                Caption = 'Base Unit of Measure';
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        recItem.Reset();
        recItem.SetRange("No.", Rec."Item No.");

        codBaseUOM := '';

        if recItem.FindFirst() then
            codBaseUOM := recItem."Base Unit of Measure";

    end;

    var
        myInt: Integer;
        codBaseUOM: Code[10];
        recItem: Record Item;
}