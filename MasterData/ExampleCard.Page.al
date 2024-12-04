page 51149 "Example Card"
{
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = Example;
    Caption = 'Example Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Example Type Code"; Rec."Example Type Code")
                {
                    Caption = 'Example Type Code';
                    ToolTip = 'Specifies the value of the Example Type Code field.';
                    ApplicationArea = All;
                }
                field("No. Series"; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the value of the No. Series field.';
                    ApplicationArea = All;
                }
            }
        }
    }


}