pageextension 64040 BMGGenJournalExt extends "General Journal"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                AccessControl.SetRange("User Security ID", UserSecurityId());
                AccessControl.SetRange("Role ID", 'BMGNOPOSTGENJNL');

                if Not AccessControl.IsEmpty() then
                    Error('You are not allowed to post Gen. Journal. Please contact your administrator.');
            end;
        }
        modify(PostAndPrint)
        {
            trigger OnBeforeAction()
            begin
                AccessControl.SetRange("User Security ID", UserSecurityId());
                AccessControl.SetRange("Role ID", 'BMGNOPOSTGENJNL');

                if Not AccessControl.IsEmpty() then
                    Error('You are not allowed to post Gen. Journal. Please contact your administrator.');
            end;
        }
    }

    var
        AccessControl: Record "Access Control";
}