tableextension 60006 tExt60006PurchaseHeader extends "Purchase Header"
{
    fields
    {
        field(60000; "origRequestor"; Text[80])
        {
            ValidateTableRelation = false;
            TableRelation = User."Full Name";
        }
        field(60001; "departmentName"; Text[50])
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Caption = 'Department Name';
        }
        field(60002; "nextApprover"; Code[50])
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Approval Entry"."Approver ID" where("Document No." = field("No."), Status = const(Open)));
            Caption = 'Current Approver';
        }
        field(60003; "followingApprovers"; Code[50])
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Approval Entry"."Approver ID" where("Document No." = field("No."), Status = filter(Created)));
            Caption = 'Next Approver';
        }
        field(60004; "notificationComment"; Text[250])
        {
            Editable = true;
            Caption = 'Notification Comment';
        }
    }
}
