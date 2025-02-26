pageextension 50103 "Purchase Order Page Ext" extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("CustomField"; Rec."CustomField")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}