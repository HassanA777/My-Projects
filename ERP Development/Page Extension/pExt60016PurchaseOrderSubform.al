pageextension 60016 pExtPurchaseOrderSubform extends "Purchase Order Subform"
{
    // 1/3/22 - Modified No. field to evaluate multiline description
    layout
    {
        addafter("Item Reference No.")
        {
            field(multiLineDescription; Rec.multiLineDescription)
            {
                MultiLine = true;
                editable = true;
                ApplicationArea = all;
                Caption = 'Description';
            }
        }
        modify("No.") //HA 1/3/22
        {
            trigger OnAfterValidate()
            begin
                if rec.multiLineDescription = '' then begin
                    rec.multiLineDescription := rec.Description;
                    rec.modify()
                end;
            end;
        }
        modify("Revision No.")
        {
            visible = false;
        }
        modify("Bin Code")
        {
            visible = false;
        }
        modify("Over-Receipt Code")
        {
            visible = false;
        }
        modify("Item Charge Qty. to Handle")
        {
            visible = false;
        }
        modify("Item Reference No.")
        {
            visible = false;
        }
        modify("Inv. Discount Amount")
        {
            visible = false;
        }
        modify("Invoice Disc. Pct.")
        {
            visible = false;
        }
        modify("Over-Receipt Quantity")
        {
            visible = false;
        }
        modify("Invoice Discount Amount")
        {
            visible = false;
        }
        modify(Description)
        {
            visible = false;
        }
    }

}


