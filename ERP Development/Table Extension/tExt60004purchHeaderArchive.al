tableextension 60004 p60004purchHeaderArchive extends "Purchase Header Archive"
{
    fields
    {
        field(60000; purchaseOrder; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Header"."No." where("Quote No." = field("No.")));
            Caption = 'Purchase Quote Number';
        }
        field(60001; purchaseOrderSum; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line Archive".Amount where("Document No." = field("No."), "Version No." = field("Version No.")));
            Caption = 'Purchase Order Sum';
        }
        field(60002; purchaseOrderSumInclTax; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line Archive"."Amount Including VAT" where("Document No." = field("No."), "Version No." = field("Version No.")));
            Caption = 'Purchase Order Sum with Tax';
        }
    }
}