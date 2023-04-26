pageextension 60001 extendPostedPurchaseReceipts extends "Posted Purchase Receipt"
{
    layout
    {
        addafter("No.")
        {
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }
}