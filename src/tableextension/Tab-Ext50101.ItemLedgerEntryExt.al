tableextension 50101 "Item Ledger Entry Ext" extends "Item Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50100; "CustomField"; Text[50])
        {
            DataClassification = ToBeClassified;
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