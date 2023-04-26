codeunit 60005 c60005CheckQuoteBeforeApproval
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeCheckPurchaseApprovalPossible', '', false, false)]
    local procedure MyProcedure(var PurchaseHeader: Record "Purchase Header")
    var
        purchLine: Record "Purchase Line";
        origRequestorErr: Text[100];
        requestReceiptDateErr: Text[100];
        departmentCodeErr: Text[100];
        purchLineNoErr: Text[100];
        purchLineDescErr: Text[100];
        purchLineQtyErr: Text[100];
        purchLineCostErr: Text[100];
        purchLineReasonErr: Text[100];
        errorState: Boolean;
    begin
        purchLineNoErr := '';
        purchLineDescErr := '';
        purchLineReasonErr := '';
        purchLineQtyErr := '';
        purchLineCostErr := '';

        if purchaseHeader."Document Type" = purchaseHeader."Document Type"::Quote then begin
            if purchaseHeader.origRequestor = '' then begin
                origRequestorErr := 'Please enter an ORIGINAL REQUESTOR';
                errorState := true;
            end
            else
                origRequestorErr := '';

            if PurchaseHeader."Requested Receipt Date" = 0D then begin
                requestReceiptDateErr := 'Please enter a REQUESTED RECEIPT DATE';
                errorState := true;
            end
            else
                requestReceiptDateErr := '';

            if PurchaseHeader.departmentName = '' then begin
                departmentCodeErr := 'Please enter a DEPARTMENT CODE';
                errorState := true
            end
            else
                departmentCodeErr := '';

            purchLine.SetRange("Document Type", PurchaseHeader."Document Type");
            purchLine.SetRange("Document No.", PurchaseHeader."No.");
            purchLine.SetRange(Type, purchLine.Type::Item);

            if purchLine.FindSet() then
                repeat
                    if purchLine."No." = '' then begin
                        purchLineNoErr := 'Please enter an ITEM NO. for the Item in the Purchase Line ';
                        errorState := true
                    end;

                    if purchLine.multiLineDescription = '' then begin
                        purchLineDescErr := 'Please enter an ITEM OR CATALOGUE NO. for the Item in the Purchase Line ';
                        errorState := true;
                    end;

                    if purchLine.reasonForRequest = '' then begin
                        purchLineReasonErr := 'Please enter a REASON for the Item in the Purchase Line ';
                        errorState := true;
                    end;

                    if purchLine.Quantity = 0 then begin
                        purchLineQtyErr := 'Please enter a QUANTITY for the Item in the Purchase Line ';
                        errorState := true;
                    end;

                    if purchLine."Direct Unit Cost" = 0 then begin
                        purchLineCostErr := 'Please enter a DIRECT UNIT COST for the Item in the Purchase Line ';
                        errorState := true;
                    end

                until purchLine.next = 0;

        end;
        if errorState = true then
            Error('%1 \ %2 \ %3 \ %4 \ %5 \ %6 \ %7 \ %8', origRequestorErr, requestReceiptDateErr, departmentCodeErr, purchLineNoErr, purchLineDescErr, purchLineReasonErr, purchLineQtyErr, purchLineCostErr)
        else
            errorState := false;

    end;
}
