report 60001 r60003
{
    ApplicationArea = All;
    Caption = 'r60003';
    ExcelLayout = 'r60003.xlsx';
    DefaultLayout = Excel;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Item; Item)
        {
            column(No_; "No.")
            {
            }
            column(qty_on_hand; itemLedgerEntries.Quantity)
            {
            }
            trigger OnAfterGetRecord()
            var

            begin
                if itemLedgerEntries.Get("No.") then begin
                    itemLedgerEntries.CalcSums(Quantity, itemLedgerEntries.Quantity);

                end;

            end;

        }
    }
    requestpage
    {
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
        itemLedgerEntries: Record "Item Ledger Entry";
}
