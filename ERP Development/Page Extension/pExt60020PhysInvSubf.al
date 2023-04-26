pageextension 60020 "pExt60020PhysInvSubf." extends "Physical Inventory Order Subf."
{
    layout
    {
        addafter("Location Code")
        {
            field("Bin Code_2"; Rec."Bin Code")
            {
                ApplicationArea = all;
                caption = 'Bin Code';
            }
        }
    }
}
