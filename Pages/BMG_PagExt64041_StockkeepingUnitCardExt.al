pageextension 64041 BMGStockkeepingUnitCardExt extends "Stockkeeping Unit Card"
{
    layout
    {
        // Add changes to page layout here
        modify("Last Date Modified")
        {
            Visible = true;
        }
        addafter("Qty. on Asm. Component")
        {
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}