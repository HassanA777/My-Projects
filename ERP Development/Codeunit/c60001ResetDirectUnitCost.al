codeunit 60001 c60001ResetDirectUnitCost
{
    Permissions = tabledata Item = m;
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterUpdateDirectUnitCost', '', false, false)]
    local procedure MyProcedure(var PurchLine: Record "Purchase Line")
    var
        item: Record item;
    begin
        if PurchLine."Document Type" = PurchLine."Document Type"::Quote then
            if PurchLine.Type = PurchLine.Type::Item then begin
                Item.Get(PurchLine."No.");
                if Item.Type = Item.Type::"Non-Inventory" then begin
                    item."Last Direct Cost" := 0;
                    PurchLine.Validate("Direct Unit Cost", 0);
                    PurchLine.Validate("Tax Area Code", 'CA');
                    PurchLine.Validate("Tax Group Code", 'TAXABLE');
                    Item.Modify();
                end;
            end;
    end;
}