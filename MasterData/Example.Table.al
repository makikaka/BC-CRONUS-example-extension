table 51145 Example
{
    DataClassification = CustomerContent;
    Caption = 'Example Table';
    LookupPageId = "Example List";
    DrillDownPageId = "Example List";
    fields
    {

        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Example Type Code"; Code[10])
        {
            Caption = 'Example Type Code';
            DataClassification = CustomerContent;
            TableRelation = ExampleType;
        }
        field(4; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ExampleSetup: Record "Example Setup";

    trigger OnInsert();
    begin
        if "No." = '' then begin
            ExampleSetup.Get();
            ExampleSetup.TestField("Example Nos.");
            NoSeriesManagement.InitSeries(ExampleSetup."Example Nos.",
                                        xRec."No. Series",
                                        0D,
                                        "No.",
                                        "No. Series");
        end;
    end;

    procedure AssistEdit(OldExample: Record Example): Boolean
    var
        Example: Record Example;
    begin
        Example := Rec;
        ExampleSetup.Get();
        ExampleSetup.TestField("Example Nos.");
        if NoSeriesManagement.SelectSeries(ExampleSetup."Example Nos.",
                                        OldExample."No. Series",
                                        Example."No. Series") then begin
            NoSeriesManagement.SetSeries(Example."No.");
            Rec := Example;
            exit(true);
        end;
    end;
}