page 51158 "Example Line Details"
{
    PageType = CardPart;
    SourceTable = ExampleLine;
    Caption = 'Line Details';

    layout
    {
        area(content)
        {
            group(LineInfo)
            {
                Caption = 'Line Information';

                // Line Identification
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the line number within the document';
                    Editable = false;
                }

                field("Example No."; Rec."Example No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the example number for this line';
                    Editable = false;
                }

                // Example Details
                field("Example Description"; Rec."Example Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the description of the selected example';
                    Editable = false;
                }

                // Line Details
                field("Line Date"; Rec."Line Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the date for this line';
                    StyleExpr = DateStyleExpr;
                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the quantity for this line';
                    StyleExpr = QuantityStyleExpr;
                }

                // Additional Calculated Fields
                field(LinePosition; GetLinePosition())
                {
                    ApplicationArea = All;
                    Caption = 'Line Position';
                    ToolTip = 'Shows the position of this line relative to all lines';
                    Editable = false;
                }
            }
        }
    }

    var
        DateStyleExpr: Text;
        QuantityStyleExpr: Text;

    trigger OnAfterGetRecord()
    begin
        // Set style for old dates
        if Rec."Line Date" < Today then
            DateStyleExpr := 'Attention'
        else
            DateStyleExpr := 'None';

        // Set style for zero quantities
        if Rec.Quantity = 0 then
            QuantityStyleExpr := 'Attention'
        else
            QuantityStyleExpr := 'None';
    end;

    // Calculate line position (e.g., "Line 2 of 5")
    local procedure GetLinePosition(): Text
    var
        ExampleLine: Record ExampleLine;
        TotalLines: Integer;
        CurrentPosition: Integer;
    begin
        ExampleLine.SetRange("Document No.", Rec."Document No.");
        TotalLines := ExampleLine.Count;

        ExampleLine.SetFilter("Line No.", '..%1', Rec."Line No.");
        CurrentPosition := ExampleLine.Count;

        exit(StrSubstNo('Line %1 of %2', CurrentPosition, TotalLines));
    end;
}