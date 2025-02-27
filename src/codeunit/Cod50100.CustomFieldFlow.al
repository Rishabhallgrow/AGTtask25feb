codeunit 50100 "CustomFieldFlow"
{

    // Transfer CustomField from Purchase Header → Item Journal Line
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnBeforeItemJnlLineInsert(var Rec: Record "Item Journal Line")
    var
        PurchHeader: Record "Purchase Header";
    begin
        // Ensure it's coming from a Purchase Document
        if Rec."Source Type".AsInteger() = DATABASE::"Purchase Header" then begin
            if PurchHeader.Get(Rec."Source No.") then begin
                Rec."CustomField" := PurchHeader."CustomField";
                Message('CustomField copied to Item Journal Line: ' + Rec."CustomField");
            end;
        end;
    end;

    // Transfer CustomField from Item Journal Line → Item Ledger Entry
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', false, false)]
    local procedure OnBeforeInsertItemLedgEntry(var ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        ItemLedgerEntry."CustomField" := ItemJournalLine."CustomField";
    end;
}
