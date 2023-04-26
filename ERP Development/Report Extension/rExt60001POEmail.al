reportextension 60001 rExt60001POEmail extends "Standard Purchase - Order"
{
    dataset
    {
        add("Purchase Line")
        {
            column(multiLineDescription; multiLineDescription)
            {
            }
        }
    }
}