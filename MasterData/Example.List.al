page 51150 "Example List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Example;
    Editable = false;
    CardPageId = "Example Card";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Example Type Code"; Rec."Example Type Code")
                {
                    ToolTip = 'Specifies the value of the Example Type Code field.';
                }
            }
        }
    }

}