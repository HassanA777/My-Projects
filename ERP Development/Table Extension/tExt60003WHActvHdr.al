tableextension 60003 pExt60003WHActvHdr extends "Warehouse Activity Header"
{
    fields
    {
        field(60000; flowCountOpenPicks; Integer)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = count("Warehouse Activity Line" WHERE("No." = field("No.")));
        }
    }
}