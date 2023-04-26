table 60000 sparesRequestTable
{
    Caption = 'sparesRequestTable';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; requestNo; Code[10])
        {
            Caption = 'requestNo';
            DataClassification = CustomerContent;
            Editable = false;
            trigger OnValidate()
            var
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if requestNo <> xRec.requestNo then begin
                    NoSeriesMgt.TestManual(requestNo);
                    "no.Series" := '';
                end;
            end;
        }
        field(2; "no.Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(3; "Machine #"; Text[100])
        {
            Caption = 'Machine #';
            DataClassification = ToBeClassified;
        }
        field(4; Urgency; Option)
        {
            Caption = 'Urgency';
            OptionMembers = Regular,Urgent_24To72Hrs,Line_Down;
        }
        field(5; "requestDetails"; Text[500])
        {
            Caption = 'Details regarding Request';
            DataClassification = ToBeClassified;
        }
        field(6; "BC Part Number"; Code[20])
        {
            TableRelation = Item."No.";
            Caption = 'BC Part Number';
            DataClassification = ToBeClassified;
        }
        field(7; "itemDescription"; Text[200])
        {
            Caption = 'Item Description';
        }
        field(8; quantity; Decimal)
        {
            Caption = 'Quantity';
            Editable = true;
        }

        field(18; Image; MediaSet)
        {
            Caption = 'Image';
        }

        field(20; "customers"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
            TableRelation = Customer.Name;
        }
        field(21; "Ship To State"; Text[50])
        {
            Caption = 'Ship To State';
            DataClassification = ToBeClassified;
        }
        field(22; "shipToCity"; Text[100])
        {
            Caption = 'Ship-To City';
            Editable = true;
        }
        field(23; "shipToAddress"; Text[200])
        {
            Caption = 'Ship-To Address';
            Editable = true;
        }
        field(24; requestType; Option)
        {
            Caption = 'Request Type';
            OptionMembers = Customer,Other;
        }
        field(25; shipToContactName; Text[100])
        {
            Caption = 'Contact Name';
            Editable = true;
        }
        field(26; shipToContactNumber; Text[50])
        {
            Caption = 'Contact Name';
            Editable = true;
        }
        field(30; "userName"; Text[80])
        {
            Caption = 'User Name';
            DataClassification = ToBeClassified;
        }
        field(31; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
        }
        field(32; "User Email"; Text[250])
        {
            Caption = 'User Email';
            DataClassification = ToBeClassified;
        }
        field(40; "Attachment"; Blob)
        {
            caption = 'Blob';
        }
        field(100; dateOpened; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date Submitted';
            Editable = false;
        }
        field(101; dateClosed; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date Closed';
        }
        field(102; trackingNumber; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(103; requestStatus; Option)
        {
            Caption = 'Request Status';
            DataClassification = ToBeClassified;
            OptionMembers = Open,Closed;
            InitValue = Open;
            Editable = false;
        }
        field(104; onHandInventory; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("BC Part Number"), "Location Code" = const('FS')));
            Caption = 'FS Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }

    }
    keys
    {
        key(PK; requestNo)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        userTable: Record User;
    begin
        rec.dateOpened := Today;
        if requestNo = '' then begin
            NoSeriesMgt.InitSeries('S', xRec."no.Series", 0D, requestNo, "no.Series");
        end;
        "User ID" := UserId;
        if userTable.Get(UserSecurityId()) then begin
            userName := userTable."Full Name";
            "User Email" := userTable."Authentication Email";
        end;
    end;

    trigger OnModify()
    var
    begin
        if rec.trackingNumber <> '' then
            rec.dateClosed := Today
    end;





}
permissionset 60000 spareRequestTableSet
{
    Assignable = true;
    Permissions = tabledata sparesRequestTable = RIMD;
}

