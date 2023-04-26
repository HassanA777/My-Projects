tableextension 60001 tExt60001PurchaseLineVndrName extends "Purchase Line"
{
    fields
    {
        field(60000; vendorsName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("Buy-from Vendor No.")));
            Caption = 'vendorsName';
        }
        field(60001; standardCost; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Standard Cost" where("No." = field("No.")));
            Caption = 'Standard Cost';
        }
        field(60002; POMinusSTD; Decimal)
        {
            Caption = 'PO - Standard';
        }
        field(60003; POMtlCostPct; Decimal)
        {
            Caption = 'PO / Mtl Cost %';
            AutoFormatType = 10;
            AutoFormatExpression = '<precision, 1:1><standard format,0>%';
        }
        field(60004; totalVarValue; Decimal)
        {
            Caption = 'Total Variance Value';
        }
        field(60005; multiLineDescription; Text[100])
        {
            TableRelation = item.description where("No." = field("No."));
            ValidateTableRelation = false;
            Editable = true;
            Caption = 'Multi Line Description';
        }
        field(60006; reasonForRequest; Text[200])
        {
            Editable = true;
            Caption = 'Reason for Request';
        }
        field(60007; origRequestor; Text[80])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Header".origRequestor where("No." = field("Document No.")));
            Caption = 'Original Requestor';
        }
    }
}