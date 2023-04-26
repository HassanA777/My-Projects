tableextension 60002 pExt60002ItemMfrName extends Item
{
    fields
    {
        field(60000; "Manufacturer Name"; Text[100])
        {
            TableRelation = Manufacturer;
            Caption = 'lookupManufacturer';
            FieldClass = FlowField;
            CalcFormula = lookup(Manufacturer.Name where(Code = field("Manufacturer Code")));
        }
        field(60001; "Vendor Name"; Text[100])
        {
            TableRelation = Vendor;
            Caption = 'lookupVendorName';
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No.")));
        }
        field(60002; "Today Quantity"; Decimal)
        {
            Caption = 'Field';
        }
        field(60003; "yDayDate"; Date)
        {
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(60004; tDayDate; Date)
        {
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(60005; yDayQuantity; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."), "Posting Date" = field(yDayDate)));
        }
        field(60006; tDayQuantity; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."), "Posting Date" = field(tDayDate)));
        }
    }
}