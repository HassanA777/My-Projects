pageextension 60005 pExtPurchaseLines extends "Purchase Lines"
{
    layout
    {
        addafter("Buy-from Vendor No.")
        {
            field(vendorsName; Rec.vendorsName)
            {
                Caption = 'Vendor Name';
                ApplicationArea = all;
                Editable = false;
            }
            field(origRequestor; Rec.origRequestor)
            {
                caption = 'Original Requestor';
                ApplicationArea = all;
                visible = true;
            }
            field(multiLineDescription; Rec.multiLineDescription)
            {
                Caption = 'Description';
                ApplicationArea = all;
                Editable = true;
            }
            field(ShortcutDimCode; ShortcutDimCode[3])
            {
                Caption = 'Project Code';
                ApplicationArea = all;
                Editable = true;
                visible = true;
            }
        }
        addafter("Location Code")
        {
            field("Bin Code"; Rec."Bin Code")
            {
                Visible = true;
                ApplicationArea = all;
                Caption = 'Bin Code';
            }
        }
        modify(Description)
        {
            visible = false;
        }
        modify("Description 2")
        {
            visible = false;
        }
        addafter("Outstanding Quantity")
        {
            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                visible = true;
                ApplicationArea = all;
                Caption = 'Created by';
            }
        }
    }
    actions
    {
        addafter("Item &Tracking Lines")
        {
            action(updateMultiLineDesc)
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                begin
                    repeat
                        if rec."Document Type" = rec."Document Type"::Order then
                            if (rec.Description <> '') and (rec.multiLineDescription = '') then begin
                                rec.multiLineDescription := rec.Description;
                                rec.modify();
                            end;
                    until rec.next() = 0;
                end;
            }
        }
    }
}
