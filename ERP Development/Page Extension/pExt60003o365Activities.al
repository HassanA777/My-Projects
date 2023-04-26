pageextension 60003 pExt60003o365Activities extends "O365 Activities"
{
    layout
    {
        addafter("Incoming Documents")
        {
            cuegroup(PODate)
            {
                Caption = 'PO lines expected by todays date';
                field("flowCountPOReceipts"; Rec.flowCountPOReceipts)
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
        theCounts: Integer;
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
        Rec.SetFilter(DateFilter, '<=%1', WorkDate());
    end;
}
