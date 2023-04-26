/*codeunit 60008 cEmailForPurchaseQuote
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', true, true)]
    local procedure MyProcedure(RecordRef: RecordRef; ReportId: Integer; var NewReportId: Integer)
    var
        notificationMgmt: Codeunit "Notification Management";
        docType: Text;
        docNo: Text;
        RecRef: RecordRef;
    begin

        if ReportId = Report::"Notification Email" then
            NewReportId := Report::"Notification Email_2"
    end;
}*/