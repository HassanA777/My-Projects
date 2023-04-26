pageextension 60026 P60026ItemCard extends "Item Card"
{
    layout
    {
        addafter("Item Category Code")
        {
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                Visible = true;
                ApplicationArea = all;
                Enabled = true;

            }
        }
    }
}
