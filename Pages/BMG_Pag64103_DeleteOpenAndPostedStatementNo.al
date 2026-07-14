page 64103 BMGCleanupStatement
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Cleanup Statement';
    Permissions = tabledata "LSC Statement" = RIMD,
                  tabledata "LSC Posted Statement" = RIMD,
                  tabledata "LSC Posted Statement Line" = RIMD;

    layout
    {
        area(Content)
        {
            group(Parameters)
            {
                field(StatementNo; StatementNo)
                {
                    ApplicationArea = All;
                    Caption = 'Statement No.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(DeleteOpenStmt)
            {
                ApplicationArea = All;
                Caption = 'Delete Open Statement';
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    RunDeleteOpenStatement(StatementNo);
                end;
            }

            action(DeletePostedStmt)
            {
                ApplicationArea = All;
                Caption = 'Delete Posted Statement';
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    RunDeletePostedStatement(StatementNo);
                end;
            }
        }
    }

    var
        StatementNo: Code[20];

    local procedure RunDeleteOpenStatement(StmtNo: Code[20])
    var
        LSCStatement: Record "LSC Statement";
    begin
        if StmtNo = '' then begin
            Message('Please enter a Statement No.');
            exit;
        end;

        LSCStatement.Reset();
        LSCStatement.SetRange("No.", StmtNo);
        if LSCStatement.IsEmpty() then begin
            Message('Open Statement %1 not found.', StmtNo);
            exit;
        end;

        if not Confirm('Are you sure you want to delete Open Statement %1?', false, StmtNo) then
            exit;

        if LSCStatement.FindFirst() then
            LSCStatement.Delete();
        Message('Open Statement %1 has been deleted.', StmtNo);
    end;

    local procedure RunDeletePostedStatement(StmtNo: Code[20])
    var
        LSCPostedStatement: Record "LSC Posted Statement";
        LSCPostedStatementLine: Record "LSC Posted Statement Line";
    begin
        if StmtNo = '' then begin
            Message('Please enter a Statement No.');
            exit;
        end;

        LSCPostedStatement.Reset();
        LSCPostedStatement.SetRange("No.", StmtNo);
        if LSCPostedStatement.IsEmpty() then begin
            Message('Posted Statement %1 not found.', StmtNo);
            exit;
        end;

        if not Confirm('Are you sure you want to delete Posted Statement %1 and all its lines?', false, StmtNo) then
            exit;

        LSCPostedStatementLine.Reset();
        LSCPostedStatementLine.SetRange("Statement No.", StmtNo);
        if LSCPostedStatementLine.FindFirst() then
            repeat
                LSCPostedStatementLine.Delete;
            until LSCPostedStatementLine.Next() = 0;

        if LSCPostedStatement.FindFirst() then
            LSCPostedStatement.Delete();

        Message('Posted Statement %1 and its lines have been deleted.', StmtNo);
    end;
}
