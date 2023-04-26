pageextension 60014 pExt60014ApprovalEntryList extends "Approval Request Entries"
{
    layout
    {
        addafter(Status)
        {
            field(departmentCode; Rec.departmentCode)
            {
                ApplicationArea = all;
                Caption = 'Department Code';
            }
        }
        modify(amount)
        {
            visible = false;
        }
        modify("Currency Code")
        {
            visible = false;
        }
        addafter(Overdue)
        {
            field("Document Type_2"; Rec."Document Type")
            {
                visible = true;
                ApplicationArea = all;
                Caption = 'Document Type';
                width = 15;
            }
        }
        modify("Salespers./Purch. Code")
        {
            visible = false;
        }
        modify("Due Date")
        {
            visible = false;
        }
        modify("Available Credit Limit (LCY)")
        {
            visible = false;
        }
        modify("Document No.")
        {
            visible = true;
            ApplicationArea = all;
        }
        moveafter("Document Type"; "Document No.")
    }
    trigger OnOpenPage()
    var
        userGroupMember: Record "User Group Member";
        userSetup: Record "User Setup";
    begin
        userGroupMember.Reset;
        if userGroupMember.get('GS BUS FULL ACCESS', UserSecurityId()) then begin
            rec.FilterGroup(2);
            rec.SetCurrentKey("Sender ID");
            rec.SetRange("Sender ID");
            rec.FilterGroup(0);
        end;
        if userGroupMember.get('GREYSCALE TEAM MEMBR', UserSecurityId(), 'Greyscale AI') then begin
            rec.FilterGroup(2);
            rec.SetCurrentKey("Sender ID");
            rec.SetRange("Sender ID");
            rec.FilterGroup(0);
        end
    end;
}