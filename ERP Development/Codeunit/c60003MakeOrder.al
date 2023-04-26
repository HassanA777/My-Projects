codeunit 60003 c60003MakeOrder
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Quote to Order", 'OnBeforeInsertPurchOrderLine', '', false, false)]
    local procedure MyProcedure(var PurchOrderLine: Record "Purchase Line"; PurchOrderHeader: Record "Purchase Header"; PurchQuoteLine: Record "Purchase Line"; PurchQuoteHeader: Record "Purchase Header")
    begin
        if PurchOrderHeader."Quote No." = '' then
            PurchOrderLine.multiLineDescription := PurchOrderLine.Description
        else begin
            PurchOrderLine.multiLineDescription := PurchQuoteLine.multiLineDescription;
            PurchOrderLine.Description := PurchQuoteLine.multiLineDescription;
        end;
    end;
}
