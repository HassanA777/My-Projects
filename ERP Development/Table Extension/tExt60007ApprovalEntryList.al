tableextension 60007 tExt60007ApprovalEntryList extends "Approval Entry"
{
    fields
    {
        field(60000; departmentCode; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Header"."Shortcut Dimension 1 Code" where("No." = field("Document No.")));
            Caption = 'Department Code';
        }
    }
}