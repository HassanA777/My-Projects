pageextension 60000 pExt60000UserIDPurchaseReceipt extends "Posted Purchase Receipts"
{
    layout
    {
        addafter("No.")
        {
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = all;
            }
        }
    }
}