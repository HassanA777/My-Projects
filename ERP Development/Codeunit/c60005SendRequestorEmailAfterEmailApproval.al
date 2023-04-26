codeunit 60006 c60005SendRqstrEmlAppr
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    local procedure test2Procedure(var ApprovalEntry: Record "Approval Entry")
    var
        userTable: Record User;
        purchaseHeader: Record "Purchase Header";
        purchaseLine: Record "Purchase Line";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        AddBodyMessage: Text;
        BodyMessage: Text;
        userEmail: Text[250];
        userName: Text[250];
        subjectMessage: Text[250];
        addUserSubject: Text;
        listData: list of [Text];
        concatenatedList: Text;
        Builder: TextBuilder;
        element: Integer;
        purchaseHeaderSum: Decimal;
    begin
        if approvalEntry."Pending Approvals" = 0 then begin
            if purchaseHeader.Get(approvalEntry."Document Type", approvalEntry."Document No.") then begin
                userTable.SetRange("Full Name", purchaseHeader.origRequestor);
                If userTable.FindFirst() then begin
                    userEmail := userTable."Contact Email";
                    if userTable."Full Name" <> '' then
                        userName := userTable."Full Name";
                end;
            end;
            if userEmail <> '' then begin
                purchaseLine.SetRange(purchaseLine."Document Type", PurchaseHeader."Document Type");
                purchaseLine.SetRange(purchaseLine."Document No.", PurchaseHeader."No.");
                if purchaseLine.FindSet() then begin
                    purchaseHeaderSum := 0;
                    repeat
                        listData.Add(purchaseLine.Description);
                        purchaseHeaderSum := purchaseHeaderSum + purchaseLine.Amount;
                    until purchaseLine.next = 0;
                end;
                for element := 1 to listData.Count() do begin
                    if concatenatedList = '' then
                        concatenatedList := listData.Get(element)
                    else
                        concatenatedList := concatenatedList + '<br>' + listData.Get(element);
                end;


                BodyMessage := 'Dear %1,<br><br>%2 has been fully approved.<br><br>Vendor: %3<br>Total($):%4<br><br>The items on this PO include:<br>%5';
                subjectMessage := 'Your request %1 has been fully approved';
                AddBodyMessage := StrSubstNo(BodyMessage, userName, purchaseHeader."No.", purchaseHeader."Buy-from Vendor Name", purchaseHeaderSum, concatenatedList);
                addUserSubject := StrSubstNo(subjectMessage, purchaseHeader."No.");
                EmailMessage.Create(userEmail, addUserSubject, AddBodyMessage, true);
                Email.Send(EmailMessage, Enum::"Email Scenario"::Notification)
            end;
        end;

    end;
}
