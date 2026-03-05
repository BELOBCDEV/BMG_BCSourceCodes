pageextension 64004 NoSeriesExt extends "No. Series"
{
    layout
    {
        // Add changes to page layout here

    }

    actions
    {
        // Add changes to page actions here
    }


    trigger OnModifyRecord(): Boolean
    var
        AccessControl: Record "Access Control";
    begin
        AccessControl.SetRange("User Security ID", UserSecurityId());
        AccessControl.SetRange("Role ID", 'BMGNOSERIES');

        If AccessControl.IsEmpty then
            Error('You do not have permission to modify a record.');

    end;

    var
        myInt: Integer;
}