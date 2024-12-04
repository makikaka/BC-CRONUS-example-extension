page 51155 "Example Line Subform"
{
    PageType = ListPart;
    UsageCategory = None;
    SourceTable = ExampleLine;
    Caption = 'Example line subpage';
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                ShowAsTree = false;

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the example document.';
                    Visible = false;
                }

                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line number of the example document.';
                    Visible = false;
                }

                field("Example No."; Rec."Example No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the example.';
                }

                field("Line Date"; Rec."Line Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of the line.';
                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity of the line.';
                }

                field("Example Description"; Rec."Example Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the example.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        DocumentNoFilter: Text;
    begin
        // Get the document number from the current filter
        DocumentNoFilter := Rec.GetFilter("Document No.");

        // Set default values for the new line
        Rec."Line Date" := WorkDate();

        // Set the document number if we have a filter
        if DocumentNoFilter <> '' then
            Rec.Validate("Document No.", DocumentNoFilter);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        exit(true);
    end;
}