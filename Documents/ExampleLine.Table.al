table 51153 ExampleLine
{
    DataClassification = CustomerContent;
    Caption = 'Example Line';
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
            TableRelation = ExampleHeader;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Example No."; Code[20])
        {
            Caption = 'Example No.';
            DataClassification = CustomerContent;
            TableRelation = Example;
        }
        field(4; "Line Date"; Date)
        {
            Caption = 'Line Date';
            DataClassification = CustomerContent;
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
            DecimalPlaces = 2;
        }
        field(7; "Example Description"; Text[50])
        {
            Caption = 'Example Description';
            FieldClass = FlowField;
            CalcFormula = lookup(Example.Description where("No." = field("Example No.")));
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}