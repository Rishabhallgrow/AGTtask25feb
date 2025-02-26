tableextension 50120 "TableExtension_ItemJnlLine" extends "Item Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(50100; "CustomField"; Text[50])
        {
            Caption = 'Custom Field';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}