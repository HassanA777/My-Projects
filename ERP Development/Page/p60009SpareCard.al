/*page 60009 "Spare Card"
{
    Caption = 'Spare Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = sparesRequestTable;

    AboutTitle = 'About item details';
    AboutText = 'With the **Item Card** you manage the information that appears in sales and purchase documents when you buy or sell an item, such as line description and price. You can also find settings for how an item is priced, replenished, stocked, and for how costing and posting is done.';

    layout
    {
        area(content)
        {
            group(Item)
            {
                Caption = 'Item';
                field("No."; rec."BC Part Number")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';

                }
                field(Description; rec.itemDescription)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;


                }

                field(Type; rec.requestType)
                {

                }



            }
            group(ShippingDetails)
            {
                Caption = 'Shipping Details';
                AboutTitle = 'For items on inventory';
                AboutText = 'Here are settings and information for an item that is kept on inventory. See or update the available inventory, current orders, physical volume and weight, and settings for low inventory handling.';

                field("Ship To State"; Rec."Ship To State")
                {
                    ApplicationArea = all;
                }
                field(shipToCity; Rec.shipToCity)
                {
                    ApplicationArea = all;
                }

            }
        }


        area(factboxes)
        {
            part("sparesPicture"; SparesListAttachment)
            {
                ApplicationArea = All;
                Caption = 'Request Picture';
                SubPageLink = "BC Part Number" = FIELD("BC Part Number");
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(Database::sparesRequestTable);
            }
        }
    }
}*/