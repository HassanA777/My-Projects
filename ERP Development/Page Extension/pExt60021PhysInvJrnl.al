pageextension 60021 pExt60021PhysInvJrnl extends "Phys. Inventory Journal"
{
    layout
    {
        addafter("Location Code")
        {
            field("Bin Code_2"; Rec."Bin Code")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        modify("F&unctions")
        {
            Enabled = true;
            Visible = true;
        }
        modify(CalculateCountingPeriod)
        {
            Enabled = true;
            Visible = true;
        }
    }
}
