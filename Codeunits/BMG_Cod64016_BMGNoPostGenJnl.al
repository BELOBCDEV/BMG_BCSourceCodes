codeunit 64016 BMGNoPostGenJnl
{
    trigger OnRun()
    begin

    end;

    /*
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnBeforeCheckGenJnlLine, '', false, false)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeCheckGenJnlLine"(GenJnlLine: Record "Gen. Journal Line"; CheckLine: Boolean; var OverrideDimErr: Boolean; var IsHandled: Boolean)
    var
        AccessControl: Record "Access Control";
    begin

        AccessControl.SetRange("User Security ID", UserSecurityId());
        AccessControl.SetRange("Role ID", 'BMGNOPOSTGENJNL');

        if Not AccessControl.IsEmpty() then
            Error('You are not allowed to post Gen. Journal. Please contact your administrator.');
    end;
    */

    var
        myInt: Integer;
}