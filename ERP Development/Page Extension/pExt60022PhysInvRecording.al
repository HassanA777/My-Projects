pageextension 60022 pExt60022PhysInvRecording extends "Phys. Invt. Recording Subform"
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
}
