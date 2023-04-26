pageextension 60023 pExt60023 extends "Purchase Order Archives"
{
    layout
    {
        addafter("Buy-from Vendor No.")
        {

            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = all;
                Caption = 'Order Date';
            }
            field("Due Date_2"; Rec."Due Date")
            {
                ApplicationArea = all;
                Caption = 'Due Date';
            }
            field(purchaseOrderSum; Rec.purchaseOrderSum)
            {
                ApplicationArea = all;
                Caption = 'Amount';
            }
            field(purchaseOrderSumInclTax; Rec.purchaseOrderSumInclTax)
            {
                ApplicationArea = all;
                Caption = 'Amount incl. VAT';
            }

        }
    }
}
