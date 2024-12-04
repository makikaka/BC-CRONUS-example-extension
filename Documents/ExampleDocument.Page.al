page 51154 "Example Document"
{
    PageType = Document;
    UsageCategory = Documents;
    ApplicationArea = All;  // Added this line - important for page visibility
    SourceTable = ExampleHeader;
    Caption = 'Example Document';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the example document.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of the example document.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the posting date of the example document.';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how many times the example document has been printed.';
                }
            }
            part(ExampleLineSubpage; "Example Line Subform")
            {
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = All;
                UpdatePropagation = Both;  // Added this line for better data synchronization
            }
        }

        area(factboxes)
        {
            part("Document Details Part"; "Example Document Details")  // Changed the ID to be more specific
            {
                ApplicationArea = Basic, Suite;  // Changed from All to Basic, Suite
                Caption = 'Document Details';
                SubPageLink = "No." = field("No.");
                Visible = true;  // Added this line to ensure visibility
            }

            part("Line Details Part"; "Example Line Details")  // Changed the ID to be more specific
            {
                ApplicationArea = Basic, Suite;  // Changed from All to Basic, Suite
                Caption = 'Line Details';
                Provider = ExampleLineSubpage;
                SubPageLink = "Document No." = field("Document No."),
                             "Line No." = field("Line No.");
                Visible = true;  // Added this line to ensure visibility
            }

            systempart(Control1900383207; Links)  // Added specific control ID
            {
                ApplicationArea = RecordLinks;
                Visible = true;
            }

            systempart(Control1905767507; Notes)  // Added specific control ID
            {
                ApplicationArea = Notes;
                Visible = true;
            }
        }
    }

    // Adding actions area to ensure complete page functionality
    actions
    {
        area(Processing)
        {
            action(ShowFactboxes)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Show Factboxes';
                Image = SetupLines;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Shows or hides the factboxes';

                trigger OnAction()
                begin
                    // This action will help users toggle factboxes if needed
                    CurrPage.ExampleLineSubpage.Page.Update(true);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // Ensure factboxes update when navigating records
        CurrPage.Update(false);
    end;
}