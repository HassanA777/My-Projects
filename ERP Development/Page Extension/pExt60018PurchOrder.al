pageextension 60018 pExtPurchOrder extends "Purchase Order"
{
    layout
    {
        moveafter("Quote No."; "Requested Receipt Date")
        movebefore("Vendor Invoice No."; "Vendor Order No.")
        addafter("Requested Receipt Date")
        {
            field(origRequestor; Rec.origRequestor)
            {
                ApplicationArea = all;
                visible = true;
                Caption = 'Original Requestor';
            }
            field(notificationComment; Rec.notificationComment)
            {
                ApplicationArea = all;
                Visible = true;
                Caption = 'Notification Comment';
            }
        }
        addafter(General)
        {
            group(Approvals)
            {
                Caption = 'Approvers';
                field(nextApprover; Rec.nextApprover)
                {
                    ApplicationArea = all;
                    caption = 'Current Approver';
                }
                field(followingApprovers; Rec.followingApprovers)
                {
                    ApplicationArea = all;
                    caption = 'Next Approver';
                }
            }
        }
        modify("Buy-from")
        {
            visible = false;
        }
        modify("Buy-from Contact")
        {
            visible = false;
        }
        modify("Vendor Invoice No.")
        {
            visible = false;
        }
        modify("No. of Archived Versions")
        {
            visible = false;
        }
        modify("Vendor Shipment No.")
        {
            visible = false;
        }
        modify("Buy-from Address 2")
        {
            visible = false;
        }
        modify("Responsibility Center")
        {
            visible = false;
        }
        modify("Assigned User ID")
        {
            visible = false;
        }
        modify("Currency Code")
        {
            visible = false;
        }
        modify("Expected Receipt Date")
        {
            visible = false;
        }
        modify("VAT Bus. Posting Group")
        {
            visible = false;
        }
        modify("Creditor No.")
        {
            visible = false;
        }
        modify("Tax Exemption No.")
        {
            visible = false;
        }
        modify("Payment Reference")
        {
            visible = false;
        }
        modify(Prepayment)
        {
            visible = false;
        }
        modify("Vendor Posting Group")
        {
            visible = false;
        }
        modify("Inbound Whse. Handling Time")
        {
            Visible = false;
        }
        modify("IRS 1099 Code")
        {
            visible = false;
        }
        modify("Lead Time Calculation")
        {
            visible = false;
        }
        modify("Order Address Code")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            visible = false;
        }
        modify("On Hold")
        {
            visible = false;
        }
        modify("Remit-to Code")
        {
            visible = false;
        }
    }
}