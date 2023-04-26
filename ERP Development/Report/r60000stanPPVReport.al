report 60000 purchasePriceVarianceReport
{
    ApplicationArea = All;
    Caption = 'Expected Purchase Price Variance Report';
    ExcelLayout = 'excel.xlsx';
    DefaultLayout = Excel;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            RequestFilterFields = "Shortcut Dimension 2 Code";
            column(PO_No; purchaseHeaderRecord."No.")
            {
                IncludeCaption = true;
            }
            column(PO_Line_No; "Line No.")
            {
                IncludeCaption = true;
            }
            column(Closure_Status; purchaseHeaderRecord.Status)
            {
                IncludeCaption = true;
            }
            column(Buyer; purchaseHeaderRecord."Purchaser Code")
            {
                IncludeCaption = true;
            }
            column(PO_Creation_Date; purchaseHeaderRecord.SystemCreatedAt)
            {
                IncludeCaption = true;
            }
            column(Vendor_Name; vendorsName)
            {
                IncludeCaption = true;
            }
            column(ItemNo; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(Inventory_Posting_Group; "Shortcut Dimension 2 Code")
            {
                IncludeCaption = true;
            }
            column(Promise_Date; "Promised Receipt Date")
            {
                IncludeCaption = true;
            }
            column(Gen_Prod_Posting_Group; "Gen. Prod. Posting Group")
            {
                IncludeCaption = true;
            }
            column(Cost_Type; itemRecord."Costing Method")
            {
                IncludeCaption = true;
            }
            column(Type; itemRecord.Type)
            {
                IncludeCaption = true;
            }
            column(Natural_Account; genProdPostGrp."Sales Account")
            {
                IncludeCaption = true;
            }
            column(Qty_On_Hand; itemRecord.Inventory)
            {
                IncludeCaption = true;
            }
            column(Line_Qty; Quantity)
            {
                IncludeCaption = true;
                DecimalPlaces = 0;
            }
            column(Qty_on_Order; itemRecord."Qty. on Purch. Order")
            {
                IncludeCaption = true;
            }
            column(Quantity_Received; "Quantity Received")
            {
                IncludeCaption = true;
                DecimalPlaces = 0;
            }
            column(Open_Shipment_Qty; "Outstanding Quantity")
            {
                IncludeCaption = true;
                DecimalPlaces = 0;
            }
            column(PO_Unit_Price; "Direct Unit Cost")
            {
                IncludeCaption = true;
            }
            column(Material_Std_Unit_Cost; standardCost)
            {
                IncludeCaption = true;
            }
            column(PO_Vs_Mtl_Std_Cost; POMinusSTD)
            {
                IncludeCaption = true;
            }
            column(PO_Vs_Mtl_Cost_Pct; POMtlCostPct)
            {
                IncludeCaption = true;
                DecimalPlaces = 0;
            }
            column(Total_Variance_Value; totalVarValue)
            {
                IncludeCaption = true;
            }

            trigger OnAfterGetRecord()
            begin
                if itemRecord.Get("Purchase Line"."No.") and ("Purchase Line"."Outstanding Quantity" > 0) then begin
                    itemRecord.CalcFields(Inventory, "Qty. on Purch. Order");
                    if purchaseHeaderRecord.Get("Purchase Line"."Document Type", "Purchase Line"."Document No.") then;
                    if genProdPostGrp.Get("Purchase Line"."Gen. Bus. Posting Group", "Purchase Line"."Gen. Prod. Posting Group") then;
                    POMinusSTD := "Direct Unit Cost" - standardCost;
                    totalVarValue := ("Direct Unit Cost" - standardCost) * "Outstanding Quantity";
                    if standardCost <> 0 then
                        POMtlCostPct := POMinusSTD / standardCost
                end;
            end;

            trigger OnPreDataItem()
            var
            begin
                SetFilter(Type, '%1', type::Item);
                SetFilter("Outstanding Quantity", '>%1', 0);
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
        itemRecord: Record Item;
        purchaseHeaderRecord: Record "Purchase Header";
        genProdPostGrp: Record "General Posting Setup";
}
