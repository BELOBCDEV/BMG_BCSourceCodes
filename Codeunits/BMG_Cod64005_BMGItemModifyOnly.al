codeunit 64005 BMGUserCanUpdateItemRecord
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;


    [EventSubscriber(ObjectType::Table, Database::Item, OnModifyOnBeforePlanningAssignmentItemChange, '', false, false)]
    local procedure Item_OnModifyOnBeforePlanningAssignmentItemChange(var Item: Record Item; xItem: Record Item; PlanningAssignment: Record "Planning Assignment"; var IsHandled: Boolean)
    var
        AccessControl: Record "Access Control";
    begin
        AccessControl.SetRange("User Security ID", UserSecurityId());
        AccessControl.SetRange("Role ID", 'BMGUSERCANUPDATEITEM');

        if AccessControl.IsEmpty() then
            Error('You are not allowed to update Item. Please contact your administrator.');

    end;

}
