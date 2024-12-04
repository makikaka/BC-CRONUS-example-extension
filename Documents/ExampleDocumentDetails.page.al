page 51157 "Example Document Details"
{
    PageType = CardPart;
    SourceTable = ExampleHeader;
    Caption = 'Document Details';

    layout
    {
        area(content)
        {
            group(GeneralInfo)
            {
                Caption = 'General Information';

                // Document Identification
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the document number';
                    Editable = false;
                }

                // Date Information
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows when the document was created';
                    Editable = false;
                    StyleExpr = DateStyleExpr;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows when the document will be posted';
                    Editable = false;
                }

                // Document Statistics
                field(TotalLines; GetTotalLines())
                {
                    ApplicationArea = All;
                    Caption = 'Total Lines';
                    ToolTip = 'Shows the total number of lines in this document';
                    Editable = false;
                }
                field(TotalQuantity; GetTotalQuantity())
                {
                    ApplicationArea = All;
                    Caption = 'Total Quantity';
                    ToolTip = 'Shows the sum of quantities across all lines';
                    Editable = false;
                    DecimalPlaces = 0 : 2;
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows how many times this document has been printed';
                    Editable = false;
                }
            }
        }
    }

    var
        DateStyleExpr: Text;

    trigger OnAfterGetRecord()
    begin
        // Set style for old documents
        if Rec."Document Date" < Today then
            DateStyleExpr := 'Attention'
        else
            DateStyleExpr := 'None';
    end;

    // Calculate total number of lines
    local procedure GetTotalLines(): Integer
    var
        ExampleLine: Record ExampleLine;
    begin
        ExampleLine.SetRange("Document No.", Rec."No.");
        exit(ExampleLine.Count);
    end;

    // Calculate total quantity across all lines
    local procedure GetTotalQuantity(): Decimal
    var
        ExampleLine: Record ExampleLine;
        TotalQty: Decimal;
    begin
        ExampleLine.SetRange("Document No.", Rec."No.");
        if ExampleLine.FindSet() then
            repeat
                TotalQty += ExampleLine.Quantity;
            until ExampleLine.Next() = 0;
        exit(TotalQty);
    end;
}
