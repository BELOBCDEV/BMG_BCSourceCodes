pageextension 64003 ItemJournalExt extends "Item Journal"
{
    layout
    {
        // Add changes to page layout here
        modify("Unit Cost")
        {
            Visible = false;
        }
        modify("Unit Amount")
        {
            Visible = false;
        }
        modify(Amount)
        {
            Visible = false;
        }
        modify("Discount Amount")
        {
            Visible = false;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}