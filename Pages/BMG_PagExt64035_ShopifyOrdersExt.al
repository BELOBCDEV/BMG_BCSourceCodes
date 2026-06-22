pageextension 64035 BMGShopifyOrder extends "Shpfy Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnDeleteRecord(): Boolean
    var
        myInt: Integer;
    begin
        Error('Deletion is not allowed.');
    end;

    var
        myInt: Integer;
}