page 60001 p60001SparesList
{
    ApplicationArea = All;
    Caption = 'Spare Part Requests';
    PageType = List;
    SourceTable = sparesRequestTable;
    UsageCategory = Lists;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(requestNo; Rec.requestNo)
                {
                    ApplicationArea = all;
                    Editable = false;
                    Caption = 'Request No.';
                }
                field("Machine #"; Rec."Machine #")
                {
                    ToolTip = 'Specifies the value of the Machine # field.';
                }
                field(Urgency; Rec.Urgency)
                {
                    ToolTip = 'Specifies the urgency of the request';
                }
                field("BC Part Number"; Rec."BC Part Number")
                {
                    ToolTip = 'Specifies the value of the BC Part Number field.';
                    AssistEdit = true;
                    trigger OnAssistEdit()
                    var
                        item: Record Item;
                    begin
                        if item.get(rec."BC Part Number") then
                            Page.RunModal(Page::"Item Card", item);
                    end;

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
                field(itemDescription; Rec.itemDescription)
                {
                    ApplicationArea = all;
                }
                field(customers; Rec.customers)
                {
                    ApplicationArea = all;
                }
                field("Ship To State"; Rec."Ship To State")
                {
                    ToolTip = 'Specifies the value of the Ship To State field.';
                }
                field(shipToCity; Rec.shipToCity)
                {
                    ToolTip = 'Specifies ship to city';
                }
                field(shipToAddress; Rec.shipToAddress)
                {
                    ToolTip = 'Specifies Ship To Address';
                }
                field(dateOpened; Rec.dateOpened)
                {
                    ToolTip = 'Date Opened';
                    Editable = false;
                }
                field(dateClosed; Rec.dateClosed)
                {
                    ToolTip = 'Date Closed';
                    Editable = false;
                }
                field(trackingNumber; Rec.trackingNumber)
                {
                    Caption = 'Tracking Number';
                    ToolTip = 'Enter tracking #';
                }
                field(userName; Rec.userName)
                {
                    ApplicationArea = all;
                    Caption = 'Submitted By';
                    Editable = false;
                }
                field("User Email"; Rec."User Email")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(requestStatus; Rec.requestStatus)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(onHandInventory; Rec.onHandInventory)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }

        }
        area(FactBoxes)
        {
            part("new Page"; SparesListAttachment)
            {
                ApplicationArea = all;
                Caption = 'Attachment';
                SubPageLink = requestNo = field(requestNo);
            }
        }

    }
    actions
    {
        area(Creation)
        {
            action(CloseRequest)
            {
                ApplicationArea = all;
                Caption = 'Close Request';
                trigger OnAction()
                var
                    errorMsg: Text[200];
                    bodyMessage: Text[250];
                    subjectMessage: Text[250];
                    addBodyMessage: Text;
                    addUserSubject: Text;
                    email: Codeunit Email;
                    emailMessage: Codeunit "Email Message";

                begin
                    errorMsg := 'Please Enter a Tracking # Before Closing this Request';
                    if (rec.trackingNumber = '') or (StrLen(rec.trackingNumber) < 10) then
                        Error('%1', errorMsg);
                    if (StrLen(rec.trackingNumber) >= 10) and (rec.requestStatus = rec.requestStatus::Open) then begin
                        bodyMessage := 'Dear %1, your Spare Parts Request %2 is set to ship.<br><br>The Tracking Number Is: %3';
                        subjectMessage := 'Your Spare Parts Request (%1) Is Ready To Ship!';
                        addBodyMessage := StrSubstNo(bodyMessage, rec.userName, rec.requestNo, rec.trackingNumber);
                        addUserSubject := StrSubstNo(subjectMessage, rec.requestNo);
                        emailMessage.Create(rec."User Email", addUserSubject, addBodyMessage, true);
                        email.Send(emailMessage, Enum::"Email Scenario"::Notification);
                        rec.requestStatus := rec.requestStatus::Closed;
                        rec.dateClosed := Today();
                        rec.Modify();
                    end;
                end;




            }
        }
    }
}