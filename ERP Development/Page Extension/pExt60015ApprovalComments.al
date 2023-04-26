pageextension 60015 pExt60015ApprovalComments extends "Approval Comments"
{
    layout
    {
        modify(comment)
        {
            visible = false;
        }
        addbefore("User ID")
        {
            field(multiLineComment; Rec.multiLineComment)
            {
                MultiLine = true;
                ApplicationArea = all;
                Caption = 'Comment & Alternates';
            }
        }
    }
}
