report 60006 transactionHistory
{
    ApplicationArea = All;
    Caption = 'Transaction History';
    ExcelLayout = 'transactionhistory.xlsx';
    DefaultLayout = Excel;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            RequestFilterFields = "Shortcut Dimension 2 Code";
            DataItemTableView = Where(Type = filter(Item));

            column(Document_No_; "Document No.")
            {
                IncludeCaption = true;
            }
            column(Line_No_; "Line No.")
            {
                IncludeCaption = true;
            }
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(Quantity; Quantity)
            {
                IncludeCaption = true;
            }
            column(Amount; Amount)
            {
                IncludeCaption = true;
            }
            column(Quantity_Received; "Quantity Received")
            {
                IncludeCaption = true;
            }
            column(Quantity_Invoiced; "Quantity Invoiced")
            {
                IncludeCaption = true;
            }
            column(phLastPostingNo; purchaseHeader."Last Posting No.")
            {
                IncludeCaption = true;
            }
            column(phNo; purchaseHeader."No.")
            {
                IncludeCaption = true;
            }
            column(phPayToVndNo; purchaseHeader."Pay-to Vendor No.")
            {
                IncludeCaption = true;
            }
            column(piNo; purchaseInvoiceHeader."No.")
            {
                IncludeCaption = true;
            }
            column(piPayToName; purchaseInvoiceHeader."Pay-to Name")
            {
                IncludeCaption = true;
            }
            column(piPostDesc; purchaseInvoiceHeader."Posting Description")
            {
                IncludeCaption = true;
            }
            column(piPostDate; purchaseInvoiceHeader."Posting Date")
            {
                IncludeCaption = true;
            }
            column(piReceiptDate; purchaseInvoiceHeader."Expected Receipt Date")
            {
                IncludeCaption = true;
            }

            column(piStatus; purchaseInvoiceHeader.Cancelled)
            {
                IncludeCaption = true;
            }
            column(pilType; purchaseInvoiceLine.Type)
            {
                IncludeCaption = true;
            }
            column(pilNo; purchaseInvoiceLine."No.")
            {
                IncludeCaption = true;
            }
            column(pilDesc; purchaseInvoiceLine.Description)
            {
                IncludeCaption = true;
            }
            column(pilQty; purchaseInvoiceLine.Quantity)
            {
                IncludeCaption = true;
            }
            column(pilUoM; purchaseInvoiceLine."Unit of Measure")
            {
                IncludeCaption = true;
            }
            column(pilUnitCost; purchaseInvoiceLine."Unit Cost")
            {
                IncludeCaption = true;
            }
            column(aeDocNo; approvalEntry."Document No.")
            {
                IncludeCaption = true;
            }
            column(aeCode; approvalEntry."Approval Code")
            {
                IncludeCaption = true;
            }
            column(aeSeqNo; approvalEntry."Sequence No.")
            {
                IncludeCaption = true;
            }
            column(aeApproverID; approvalEntries)
            {

            }
            column(aeStatus; approvalEntry.Status)
            {
                IncludeCaption = true;
            }
            column(aeAmount; approvalEntry.Amount)
            {
                IncludeCaption = true;
            }
            trigger OnAfterGetRecord()

            begin
                clear(approvalEntry);
                clear(purchaseInvoiceHeader);
                clear(purchaseInvoiceLine);
                clear(purchaseHeader);
                clear(approvalEntries);
                if purchaseHeader.Get("Purchase Line"."Document Type", "Purchase Line"."Document No.") and (Type = Type::Item) then begin
                    approvalEntry.Reset();
                    approvalEntry.SetFilter("Document No.", purchaseHeader."No.");
                    approvalEntry.SetFilter("Document Type", '%1', purchaseHeader."Document Type");
                    if approvalEntry.FindSet() then begin
                        approvalEntries := '';
                        repeat
                            approvalEntries := approvalEntries + '|' + approvalEntry."Approver ID" + '|';
                        until approvalEntry.Next() = 0;
                    end;
                    if purchaseInvoiceHeader.Get(purchaseHeader."Last Posting No.") then begin
                        purchaseInvoiceLine.Reset();
                        purchaseInvoiceLine.SetFilter("No.", "Purchase Line"."No.");
                        purchaseInvoiceLine.SetFilter("No.", "Purchase Line"."No.");
                        if purchaseInvoiceLine.FindSet() then;
                    end;
                end;
            end;

            trigger OnPreDataItem()
            var
            begin
                SetFilter(Type, '%1', type::Item);
                ///SetFilter("Outstanding Quantity", '>%1', 0);
            end;
        }
    }


    requestpage
    {
        SaveValues = true;
        layout
        {

            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {

            area(processing)
            {

            }
        }
    }

    var
        purchaseInvoiceHeader: Record "Purch. Inv. Header";
        purchaseHeader: Record "Purchase Header";
        purchaseInvoiceLine: Record "Purch. Inv. Line";
        approvalEntry: Record "Approval Entry";
        approvalEntries: Text[1000];
        purchaseInvoiceLineEntries: Text[1000];
}
