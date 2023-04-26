pageextension 60008 pExt60008ItemListKarenView extends "Item List"
{
    layout
    {
        modify("Manufacturer Code")
        {
            Visible = false;
        }
        modify("Vendor No.")
        {
            Visible = false;
        }
        modify("Cost is Adjusted")
        {
            Visible = false;
        }
        modify("Unit Cost")
        {
            Visible = false;
        }
        modify("Unit Price")
        {
            Visible = false;
        }
        modify("Substitutes Exist")
        {
            visible = false;
        }
        modify("Lead Time Calculation")
        {
            Visible = true;
        }
        modify(Type)
        {
            Visible = false;
        }
        addafter("Revision No.")
        {
            field(ManufacturerName; rec."Manufacturer Name")
            {
                Caption = 'Mfg Name';
                ApplicationArea = all;
                Editable = false;
            }
            field("Vendor Item No. pExt"; Rec."Vendor Item No.")
            {
                Caption = 'Vendor Item No.';
                ApplicationArea = all;
                Editable = false;
            }
            field("Type pExt"; Rec.Type)
            {
                Caption = 'Type';
                ApplicationArea = all;
                Editable = false;
            }
            field("Replenishment System pExt"; Rec."Replenishment System")
            {
                Caption = 'Replenishment System';
                ApplicationArea = all;
                Editable = false;
            }
            field("Item Category Code pExt"; Rec."Item Category Code")
            {
                Caption = 'Item Category Code';
                ApplicationArea = all;
                Editable = false;
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                Caption = 'Product Code';
                ApplicationArea = all;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                Caption = 'Product2 Code';
                ApplicationArea = all;
                Editable = true;
            }
        }
        addbefore("Assembly BOM")
        {
            field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
            {
                Caption = 'Qty. On Order';
                ApplicationArea = all;
                Editable = false;
            }
            field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
            {
                Caption = 'Qty. On Purchase Order';
                ApplicationArea = all;
                Editable = false;
            }
        }
        addafter("Base Unit of Measure")
        {
            field("Standard Cost pExt"; Rec."Standard Cost")
            {
                Caption = 'Standard Cost';
                ApplicationArea = all;
                Editable = false;
            }
        }
        addbefore("Lead Time Calculation")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                Caption = 'Vendor Name';
                ApplicationArea = all;
                Editable = false;
            }
        }
    }
    trigger OnOpenPage()
    var
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
