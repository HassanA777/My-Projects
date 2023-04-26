pageextension 60012 pExtPurchQuoteArchive extends "Purchase Quote Archives"
{
    layout
    {
        addafter("Archived By")
        {
            field(purchaseOrder; Rec.purchaseOrder)
            {
                ApplicationArea = All;
                Caption = 'Purchase Order #';
            }
        }
    }
}