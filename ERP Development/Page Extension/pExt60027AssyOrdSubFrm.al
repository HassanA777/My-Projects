pageextension 60027 pExt60027AssyOrdSubFrm extends "Assembly Order Subform"
{
    layout
    {
        modify("Bin Code")
        {
            visible = true;
            ApplicationArea = all;
        }
        moveafter("Location Code"; "Bin Code")
    }
}