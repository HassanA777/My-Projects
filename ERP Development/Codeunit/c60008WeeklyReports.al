/*codeunit 60008 c60008WeeklyReports
{
    trigger OnRun()
    var

    begin
        SendEmailWithAttachment();
    end;

    procedure SendEmailWithAttachment()
    var
        ReportExample: Report purchasePriceVarianceReport;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        InStr: InStream;
        OutStr: OutStream;
        ReportParameters: Text;

    begin
        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(Report::purchasePriceVarianceReport, '', ReportFormat::Excel, OutStr);
        TempBlob.CreateInStream(InStr);
        EmailMessage.Create('hassan@greyscaleai.com', 'subject', 'body');
        EmailMessage.AddAttachment('FileName.xlsx', 'Xlsx', InStr);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Notification);
    end;

}*/