pageextension 60011 pExt60011InvPicks extends "Inventory Picks"
{
    layout
    {
        modify("No. of Lines")
        {
            Visible = false;
        }
        addafter("External Document No.")
        {
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = all;
                Visible = true;

            }
            field(flowCountOpenPicks; Rec.flowCountOpenPicks)
            {
                Caption = 'Open # of Lines';
                ApplicationArea = all;
                Visible = true;
            }
        }
    }
}
