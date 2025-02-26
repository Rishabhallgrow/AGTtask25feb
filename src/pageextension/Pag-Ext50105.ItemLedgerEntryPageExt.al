pageextension 50105 "Item Ledger Entry Page Ext" extends "Item Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter(Quantity)
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