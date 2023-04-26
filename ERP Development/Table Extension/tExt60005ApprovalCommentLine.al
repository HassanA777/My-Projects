tableextension 60005 tExt60005 extends "Approval Comment Line"
{
    fields
    {
        field(60000; multiLineComment; Text[100])
        {
            Caption = 'Comment';
            DataClassification = ToBeClassified;
            Width = 30;
        }
    }
}