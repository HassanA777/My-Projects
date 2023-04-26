pageextension 60006 pExt60006PurchaseQuoteReqField extends "Purchase Quote"
{
    layout
    {
        modify("Buy-from")
        {
            Visible = false;
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
        modify("Buy-from Vendor Name")
        {
            ShowMandatory = true;
        }
        modify("Buy-from Country/Region Code")
        {
            Visible = false;
        }
        modify("Buy-from City")
        {
            visible = false;
        }
        modify("Buy-from Post Code")
        {
            Visible = false;
        }
        modify("Order Address Code")
        {
            visible = false;
        }
        modify("Requested Receipt Date")
        {
            ShowMandatory = true;
        }
        modify("Expected Receipt Date")
        {
            Visible = false;
        }
        modify("Buy-from Vendor No.")
        {
            Visible = false;
        }
        modify("Buy-from Address")
        {
            Visible = false;
        }
        modify("Buy-from Address 2")
        {
            Visible = false;
        }
        modify("Buy-from Contact")
        {
            visible = false;
        }
        modify("Pay-to City")
        {
            visible = false;
        }
        modify("Pay-to Country/Region Code")
        {
            Visible = false;
        }
        modify("Buy-from Contact No.")
        {
            visible = false;
        }
        modify(BuyFromContactPhoneNo)
        {
            Visible = false;
        }
        modify(BuyFromContactMobilePhoneNo)
        {
            visible = false;
        }
        modify(BuyFromContactEmail)
        {
            visible = false;
        }
        modify("Document Date")
        {
            visible = false;
        }
        modify("Due Date")
        {
            visible = false;
        }
        modify("Order Date")
        {
            visible = false;
        }
        modify("No. of Archived Versions")
        {
            visible = false;
        }
        modify("Vendor Order No.")
        {
            visible = false;
        }
        modify("Vendor Shipment No.")
        {
            visible = false;
        }
        modify("Purchaser Code")
        {
            visible = false;
        }
        modify("Campaign No.")
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
        modify("Payment Terms Code")
        {
            visible = false;
        }
        modify("Transaction Type")
        {
            visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            visible = false;
        }
        modify("Payment Discount %")
        {
            visible = false;
        }
        modify("Pmt. Discount Date")
        {
            visible = false;
        }
        modify("Shipment Method Code")
        {
            visible = false;
        }
        modify("Payment Reference")
        {
            visible = false;
        }
        modify("Creditor No.")
        {
            visible = false;
        }
        modify("On Hold")
        {
            visible = false;
        }
        modify("Ship-to Name")
        {
            visible = false;
        }
        modify("Ship-to Address")
        {
            visible = false;
        }
        modify("Ship-to Address 2")
        {
            visible = false;
        }
        modify("Ship-to Post Code")
        {
            visible = false;
        }
        modify("Ship-to City")
        {
            visible = false;
        }
        modify("Ship-to Country/Region Code")
        {
            visible = false;
        }
        modify("Ship-to Contact")
        {
            visible = false;
        }
        modify("Pay-to Address")
        {
            visible = false;
        }
        modify("Pay-to Name")
        {
            visible = false;
        }
        modify("Pay-to Address 2")
        {
            visible = false;
        }
        modify("Pay-to County")
        {
            visible = false;
        }
        modify("Pay-to Post Code")
        {
            visible = false;
        }
        modify("Pay-to Contact No.")
        {
            visible = false;
        }
        modify("Pay-to Contact")
        {
            visible = false;
        }
        modify(PayToContactPhoneNo)
        {
            visible = false;
        }
        modify(PayToContactMobilePhoneNo)
        {
            visible = false;
        }
        modify(PayToContactEmail)
        {
            visible = false;
        }
        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Ship-to County")
        {
            visible = false;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Editable = true;
            ApplicationArea = all;
            ShowCaption = true;
            ShowMandatory = true;
            Tooltip = 'Please select the correct dept. code according to the below: Brian''s team - AI&ML(2000..2020), R&D & SW ENG (2050..2060) |||| Nat''s Team - OPS(1000..1999), HW & MFG ENG. (2030..2040), FIELD SERVICE (3000..3999), CUSTOMER SUCCESS (4000.4999)';
        }

        modify("Shipping and Payment")
        {
            Visible = false;
        }
        modify("Invoice Details")
        {
            visible = false;
        }
        moveafter("Buy-from Vendor Name"; "Shortcut Dimension 1 Code")
        addafter("Shortcut Dimension 1 Code")
        {
            field(departmentName; Rec.departmentName)
            {
                Editable = false;
                ApplicationArea = all;
                Caption = 'Department Name';
            }
        }
        moveafter(departmentName; "Requested Receipt Date")
        addbefore(Status)
        {
            field(origRequestor; Rec.origRequestor)
            {
                Caption = 'Original Requestor';
                ApplicationArea = all;
                Editable = true;
                ShowMandatory = true;
                ToolTip = 'Select the name of the original requestor for this requisition';
            }
        }
    }
}