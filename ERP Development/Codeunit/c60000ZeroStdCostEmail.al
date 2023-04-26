codeunit 60000 zeroStdCostEmail
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterAssignItemValues', '', false, false)]
    local procedure OnAfterAssignitemValues(CurrentFieldNo: Integer; Item: Record Item; PurchHeader: Record "Purchase Header"; var PurchLine: Record "Purchase Line")
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        AddBodyMessage: Text;
        BodyMessage: Text;

    begin
        if PurchLine.Type = PurchLine.Type::Item then
            if item.type = Item.Type::Inventory then
                if Item."Costing Method" = item."Costing Method"::Standard then
                    if item."Standard Cost" = 0 then begin
                        BodyMessage := 'Dear Stan, <br> A purchase order created on %1 with order# %2 has been entered for purchase and has a standard cost of $0. <br> The item # is %3 described as %4 with a PO price of %5 and a quantity of %6';
                        AddBodyMessage := StrSubstNo(BodyMessage, PurchLine.GetDate(), PurchHeader."No.", item."No.", item.Description, PurchLine."Direct Unit Cost", PurchLine.Quantity);
                        EmailMessage.Create('stan.edwards@greyscaleai.com', 'Purchase Line with a standard cost of $0', AddBodyMessage, true);
                        Email.Send(EmailMessage, Enum::"Email Scenario"::Notification)
                    end
    end;
}