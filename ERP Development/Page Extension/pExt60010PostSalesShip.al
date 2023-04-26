pageextension 60010 pExt60010PostSalesShip extends "Posted Sales Shipments"
{
    layout
    {
        modify("Sell-to Customer No.")
        {
            Visible = false;
        }
        modify("Currency Code")
        {
            Visible = false;
        }
        modify("No. Printed")
        {
            visible = false;
        }
        addafter("Location Code")
        {
            field("Posting Description"; Rec."Posting Description")
            {
                Caption = 'Sales Order';
                ApplicationArea = all;

            }
        }
    }
}
