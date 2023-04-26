page 60000 pSparesList
{
    PageType = API;
    APIPublisher = 'Greyscale';
    APIGroup = 'Test';
    EntityCaption = 'SparesRequest';
    EntitySetCaption = 'SparesRequest2';
    EntityName = 'SparesRequest3';
    EntitySetName = 'SparesRequest4';
    ODataKeyFields = SystemId;
    SourceTable = sparesRequestTable;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("BCPartNumber"; Rec."BC Part Number")
                {
                    ToolTip = 'Specifies the value of the BC Part Number field.';
                    ApplicationArea = all;
                    trigger OnLookup(var text: Text): Boolean
                    var
                        item: Record Item;
                    begin
                        item.Reset();
                        Item.SetCurrentKey("No.");
                        Item.Ascending(true);
                        item.SetFilter(Type, 'Inventory');
                        item.FindFirst();
                        if page.RunModal(0, Item) = Action::LookupOK then
                            Rec.Validate(Rec."BC Part Number", item."No.")
                    end;
                }
                field(requestNo; Rec.requestNo)
                {
                    ToolTip = 'Specifies the value of the requestNo field.';
                }
                field(requestDetails; Rec.requestDetails)
                {
                    ToolTip = 'General details for request';
                }
                field("MachineNo"; Rec."Machine #")
                {
                    ToolTip = 'Specifies the value of the Machine # field.';
                }

                field(Urgency; Rec.Urgency)
                {
                    ToolTip = 'Specifies the value of the Urgency field.';
                }

                field(itemDescription; Rec.itemDescription)
                {
                    ToolTip = 'Include a description of the item';
                }
                field(quantity; Rec.quantity)
                {
                    ToolTip = 'Specifies the quantity required';
                }
                field(customers; Rec.customers)
                {
                    ToolTip = 'Customers Name';
                }
                field("ShipToState"; Rec."Ship To State")
                {
                    ToolTip = 'Specifies the value of the Ship To State field.';
                }
                field(shipToCity; Rec.shipToCity)
                {
                    ToolTip = 'Specifies the Ship-To City';
                }
                field(shipToAddress; Rec.shipToAddress)
                {
                    ToolTip = 'Specifies the Ship-To Adddress';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
                field(Attachment; Rec.Attachment)
                {
                    ToolTip = 'Attachment';
                }
                field(userName; Rec.userName)
                {
                    ToolTip = 'Auto-generated name of the user submitting the request';
                }
                field("UserEmail"; Rec."User Email")
                {
                    ToolTip = 'User Email';
                }
                field(requestType; Rec.requestType)
                {

                }
                field(shipToContactName; Rec.shipToContactName)
                {

                }
                field(shipToContactNumber; Rec.shipToContactNumber)
                {

                }
            }
        }
    }
}