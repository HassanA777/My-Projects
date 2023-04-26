pageextension 60004 pExt60004PurchaseOrderListDesc extends "Purchase Order List"
{
    layout
    {
        modify("Assigned User ID")
        {
            ApplicationArea = all;
            Visible = false;
        }
        modify("Vendor Authorization No.")
        {
            ApplicationArea = all;
            visible = false;
        }
        addafter("Buy-from Vendor Name")
        {
            field(origRequestor; Rec.origRequestor)
            {
                ApplicationArea = all;
                Caption = 'Original Requestor';
            }
        }
        modify("Due Date")
        {
            ApplicationArea = all;
            Visible = true;
        }
        moveafter("Document Date"; "Due Date")
    }
    trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("No.");
        Rec.Ascending(false);
    end;
}