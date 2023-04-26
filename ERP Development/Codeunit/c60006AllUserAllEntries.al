codeunit 60007 c60006AllUserAllEntries
{
    [EventSubscriber(ObjectType::Table, Database::"Approval Entry", 'OnBeforeMarkAllWhereUserisApproverOrSender', '', false, false)]
    local procedure MyProcedure(var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;
}
