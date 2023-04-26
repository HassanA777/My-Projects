pageextension 60009 pExt60009SalesOrderListView extends "Sales Order List"
{
    layout
    {
        modify("Sell-to Customer No.")
        {
            Visible = false;
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }

    }
}
