page 60002 SparesListAttachment
{
    ApplicationArea = All;
    Caption = 'SparesListAttachment';
    PageType = CardPart;
    SourceTable = sparesRequestTable;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Attachment; Rec.Attachment)
                {
                    ToolTip = 'Attachment';
                    Visible = true;
                }
            }
        }
    }
}