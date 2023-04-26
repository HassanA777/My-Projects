pageextension 60007 pExt60007PQuoteSubFormReqField extends "Purchase Quote Subform"
{
    layout
    {
        modify("No.")
        {
            ShowMandatory = mandatoryField;
            ApplicationArea = all;
            trigger OnLookup(var Text: Text): Boolean
            var
                item: Record Item;
                itemCharge: Record "Item Charge";
            begin
                if rec.type = rec.type::Item then begin
                    item.Reset();
                    Item.SetCurrentKey("No.");
                    Item.Ascending(false);
                    item.SetFilter(Type, 'Non-Inventory');
                    item.FindFirst();
                    if page.RunModal(0, Item) = Action::LookupOK then
                        Rec.Validate(Rec."No.", item."No.")
                end;
                if rec.type = rec.type::"Charge (Item)" then begin
                    if page.RunModal(0, itemCharge) = Action::LookupOK then
                        Rec.Validate(Rec."No.", itemCharge."No.")
                end
            end;
        }
        modify(Quantity)
        {
            ApplicationArea = all;
            ShowMandatory = mandatoryField;
        }
        modify("Item Reference No.")
        {
            visible = false;
        }
        modify("VAT Prod. Posting Group")
        {
            Visible = false;
        }
        modify("Unit of Measure Code")
        {
            visible = true;

            trigger OnLookup(var Text: Text): Boolean
            var
                unitOfMeasuretable: Record "Unit of Measure";

            begin
                unitOfMeasuretable.SetCurrentKey(Code);
                unitOfMeasuretable.SetFilter(Code, '%1|%2|%3|%4', 'EACH', 'UNIT', 'FEET', 'PACK');
                unitOfMeasuretable.FindFirst();
                if page.RunModal(0, unitOfMeasuretable) = Action::LookupOK then
                    rec.Validate(rec."Unit of Measure Code", unitOfMeasuretable.Code);
            end;
        }
        modify("Line Discount %")
        {
            visible = false;
        }
        modify("Qty. to Assign")
        {
            visible = false;
        }
        modify("Qty. Assigned")
        {
            visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            visible = false;
        }
        modify("Direct Unit Cost")
        {
            ApplicationArea = all;
            ShowMandatory = mandatoryField;
            Caption = 'Direct Unit Cost';
        }
        modify("Location Code")
        {
            visible = false;
        }
        modify("Shortcut Dimension 1 Code")
        {
            visible = false;
        }
        modify("Total Amount Excl. VAT")
        {
            visible = false;
        }
        modify("Total Amount Incl. VAT")
        {
            visible = true;
        }
        modify("Total VAT Amount")
        {
            visible = false;
        }
        modify("Invoice Disc. Pct.")
        {
            visible = false;
        }
        modify("Invoice Discount Amount")
        {
            visible = false;
        }
        modify(Description)
        {
            ApplicationArea = all;
            Visible = false;
            ShowMandatory = false;
        }
        modify(FilteredTypeField)
        {
            ApplicationArea = all;
            ShowMandatory = true;
            trigger OnAfterValidate()
            begin
                if rec.Type = rec.type::" " then
                    mandatoryField := false
                else
                    if rec.Type = rec.type::Item then
                        mandatoryField := true
            end;
        }
        addafter("Item Reference No.")
        {
            field(multiLineDescription; Rec.multiLineDescription)
            {
                MultiLine = true;
                ShowMandatory = true;
                Editable = true;
                ApplicationArea = all;
                Caption = 'Item or Catalog #';
                Width = 40;
            }
            field(reasonForRequest; Rec.reasonForRequest)
            {
                MultiLine = true;
                ShowMandatory = true;
                Editable = true;
                ApplicationArea = all;
                Caption = 'Reason for Request';
                Width = 40;
            }
        }
        movebefore("Unit of Measure"; "Unit of Measure Code")
    }
    var
        mandatoryField: Boolean;
}