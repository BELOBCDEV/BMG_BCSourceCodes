codeunit 64004 BMGItemImport
{
    trigger OnRun()
    begin
        recItem2.Reset();
        recItem2.ChangeCompany('QQHI');

        if recItem2.FindSet() then
            recItem2.DeleteAll();

        intRecCtr := 0;

        recItem.Reset();
        if recItem.FindFirst() then
            repeat
                recItem2.Init();
                recItem2.TransferFields(recItem);
                IF recItem2.Insert() then
                    intRecCtr += 1;
            until recItem.Next() = 0;

        if intRecCtr > 0 then
            Message('%1 has been inserted.', intRecCtr);
    end;

    var
        intRecCtr: Integer;
        recItem: Record Item;
        recItem2: Record Item;
}