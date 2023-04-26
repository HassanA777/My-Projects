pageextension 60028 pExt60028PurchaseAgent extends "Purchase Agent Activities"
{
    layout
    {
        addafter(PartiallyInvoiced)
        {
            cuegroup(PODate)
            {
                Caption = 'PO lines expected by todays date';
                field("flowCountPOReceipts"; activitiesCue.flowCountPOReceipts)
                {
                    Caption = '# of Lines';
                    ApplicationArea = all;
                    Editable = false;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
    begin
        Rec.Reset();
        activitiesCue.Get();
        if not Rec.Get() then begin
            activitiesCue.Get();
            Rec.Init();
            Rec.Insert();
        end;
        Rec.SetFilter(Rec.DateFilter, '<=%1', WorkDate());
    end;

    var
        activitiesCue: Record "Activities Cue";

}

