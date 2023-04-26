page 60004 itemsAPI
{
    PageType = API;
    APIPublisher = 'Greyscale';
    APIGroup = 'Test';
    EntityCaption = 'item1';
    EntitySetCaption = 'item2';
    EntityName = 'item3';
    EntitySetName = 'item4';
    ODataKeyFields = "No.";
    SourceTable = Item;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No"; Rec."No.")
                {

                }
                field("GlobalDimension2Code"; Rec."Global Dimension 2 Code")
                {

                }
                field(Description; Rec.Description)
                {

                }
                field("Description2"; Rec."Description 2")
                {

                }
                field("ItemCategoryCode"; Rec."Item Category Code")
                {

                }
                field(Picture; Rec.Picture)
                {

                }

            }
        }
    }
}