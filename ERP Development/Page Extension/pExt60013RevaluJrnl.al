pageextension 60013 pExtRevaluJrnl extends "Revaluation Journal"
{
    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("Gen_Bus_Posting_Group"; Rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
            }
        }
    }
}
