tableextension 60000 activitiesCueAddCountOfPOToday extends "Activities Cue"
{
    fields
    {
        field(60000; flowCountPOReceipts; Integer)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = count("Purchase Line" WHERE("Document Type" = FILTER(Order), Type = CONST(Item), "Planned Receipt Date" = field(DateFilter), "Outstanding Quantity" = filter(> 0)));
        }
        field(60001; DateFilter; Date)
        {
            FieldClass = FlowFilter;
            Editable = false;
        }
    }
}
