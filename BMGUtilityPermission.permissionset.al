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
        codeunit BMGItemImport = X,
        codeunit BMGPopulateCustPriceGroup = X,
        codeunit BMGReopenPO_EventSubs = X,
        codeunit BMGUserCanUpdateItemRecord = X,
        tabledata BMGBankLedgEntryExt = RIMD,
        table BMGBankLedgEntryExt = X,
        codeunit BMGTransferOrderMgt = X,
        page BMGBankAccLedgerEntries2Ext = X,
        codeunit BMGBankAccLedgEntryUpdate = X,
        codeunit BMGCleanupIntSynchErrors = X,
        codeunit BMGSendEmailIfJQFails = X,
        report BMGGeneralJournalUnposted = X,
        report BMGPaymentJournalUnposted = X,
        codeunit BMGPostShippedSalesOrder = X,
        codeunit BMGMemberPointEntryExpDateMgt = X,
        codeunit BMGProcessShopifyOrdersSubs = X;
}