page 60003 p60003DailyInvDelta
{
    ApplicationArea = All;
    Caption = 'Daily Inventory Delta';
    PageType = List;
    SourceTable = Item;
    UsageCategory = Lists;
    CardPageId = "Item Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    //TableRelation = item."No.";
                    ToolTip = 'Specifies the number of the item.';
                }
                field(yDayQuantity; Rec.yDayQuantity)
                {
                    ToolTip = 'Specifies the value of the yDayQuantity field.';
                }
                field(tDayQuantity; Rec.tDayQuantity)
                {
                    ToolTip = 'Specifies the value of the tDayQuantity field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        If not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
        Rec.SetFilter(yDayDate, '< %1', CalcDate('-1D', WorkDate()));
        Rec.SetFilter(tDayDate, '<= %1', WorkDate());
    end;
}
