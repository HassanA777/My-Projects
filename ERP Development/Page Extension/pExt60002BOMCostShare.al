pageextension 60002 pExt60002IndentCostBOMShare extends "BOM Cost Shares"
{
    layout
    {
        addafter(Type)
        {
            field("Indent"; Rec.Indentation)
            {
                ApplicationArea = all;
            }
        }
    }
}
