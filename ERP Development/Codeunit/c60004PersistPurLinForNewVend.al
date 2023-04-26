codeunit 60004 c60004PersistPurLinForNewVend
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnValidateBuyFromVendorNoBeforeRecreateLines', '', false, false)]

    local procedure testFunction(CallingFieldNo: Integer; var PurchaseHeader: Record "Purchase Header"; var Vendor: Record Vendor)
    var
    begin
        if (PurchaseHeader."Tax Area Code" = '') then begin
            PurchaseHeader."Tax Area Code" := 'CA';
            PurchaseHeader."Tax Liable" := true;
        end
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnRecreatePurchLinesOnBeforeInsertPurchLine', '', false, false)]
    local procedure MyProcedure(var PurchaseLine: Record "Purchase Line"; var TempPurchaseLine: Record "Purchase Line")
    begin
        PurchaseLine.multiLineDescription := TempPurchaseLine.multiLineDescription;
        PurchaseLine.reasonForRequest := TempPurchaseLine.reasonForRequest;
    end;
}