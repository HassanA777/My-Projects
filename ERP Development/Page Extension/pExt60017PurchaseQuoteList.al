pageextension 60017 pExt60017PurchaseQuoteList extends "Purchase Quotes"
{
    layout
    {
        modify("Vendor Authorization No.")
        {
            ApplicationArea = all;
            visible = false;
        }
        modify("Assigned User ID")
        {
            ApplicationArea = all;
            Visible = false;
        }
        addafter("Buy-from Vendor Name")
        {
            field(origRequestor; Rec.origRequestor)
            {
                ApplicationArea = all;
                visible = true;
                Caption = 'Original Requestor';
            }
        }
    }
}
