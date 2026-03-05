namespace BMGUtilityPermission;

permissionset 64000 BMGUtilityPermission
{
    Assignable = true;
    Permissions = codeunit "BMG Utility" = X,
        codeunit "BMG Purch. Post Receive Only" = X,
        report SalesAmountByBranch = X,
        codeunit BMGUpdateUserSetup = X,
        codeunit BMGUpdateSCMUsers = X,
        report BMGItemRegister = X,
        codeunit BMGItemImport = X;
}