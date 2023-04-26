codeunit 60002 c60002PurchaseHeaderTaxLiable
{
    [EventSubscriber(ObjectType::Page, Page::"Purchase Quote", 'OnAfterValidateEvent', 'Buy-from Vendor Name', false, false)]
    local procedure MyProcedure(var Rec: Record "Purchase Header")
    begin
        if Rec."Tax Area Code" = '' then begin
            Rec."Tax Liable" := true;
            Rec."Tax Area Code" := 'CA';
            rec.Modify();
        end
    end;
}