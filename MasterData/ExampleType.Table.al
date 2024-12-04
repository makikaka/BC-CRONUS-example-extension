table 51146 ExampleType
{
    DataClassification = CustomerContent;
    Caption = 'Example Type';

    LookupPageId = "Example Types";
    DrillDownPageId = "Example Types";
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }


}