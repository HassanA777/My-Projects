report 60002 customInventoryValuation
{
    ApplicationArea = All;
    Caption = 'Inventory Report';
    ExcelLayout = 'customInventoryReportValuation.xlsx';
    DefaultLayout = Excel;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Item; Item)
        {
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(Base_Unit_of_Measure; "Base Unit of Measure")
            {
                IncludeCaption = true;
            }
            column(Costing_Method; "Costing Method")
            {
                IncludeCaption = true;
            }
            column(Standard_Cost; "Standard Cost")
            {
                IncludeCaption = true;
            }
            dataitem("BinContent"; "Bin Content")
            {
                DataItemLink = "Item No." = field("No.");

                column(Quantity__Base_; "Quantity (Base)")
                {
                    IncludeCaption = true;
                }
                column(Inventory_Value; "Inventory Value")
                {
                    IncludeCaption = true;
                }
                column(Location_Code; "Location Code")
                {
                    IncludeCaption = true;
                }
                column(Zone_Code; "Zone Code")
                {
                    IncludeCaption = true;
                }
                column(Bin_Code; "Bin Code")
                {
                    IncludeCaption = true;
                }
                trigger OnAfterGetRecord()
                var
                    itemRecord: Record item;
                begin
                    "Inventory Value" := item."Standard Cost" * "Quantity (Base)";
                end;
            }
            trigger OnPreDataItem()
            var
                binContentRecord: Record "Bin Content";
            begin
                SetFilter(Type, '%1', type::Inventory);
                SetFilter("No.", '<>%1', '');
                SetFilter(Inventory, '>%1', 0);
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

}