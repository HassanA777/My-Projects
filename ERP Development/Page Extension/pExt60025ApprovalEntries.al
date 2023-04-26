pageextension 60025 p60025ApprovalEntries extends "Approval Entries"
{
    layout
    {
        addafter("Amount (LCY)")
        {
            field("Approval Code"; Rec."Approval Code")
            {
                ApplicationArea = all;
            }
        }

    }
}