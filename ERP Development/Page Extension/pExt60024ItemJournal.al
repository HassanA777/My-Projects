pageextension 60024 pExt60024ItemJournal extends "Item Journal"
{
    layout
    {
        addafter("Location Code")
        {
            field("Bin Code_1"; Rec."Bin Code")
            {
                ApplicationArea = all;
                visible = true;
            }
            field("New Bin Code"; Rec."New Bin Code")
            {
                ApplicationArea = all;
                Visible = true;
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                ApplicationArea = all;
                Visible = true;
                Caption = 'Created By';
            }
        }
    }
}
