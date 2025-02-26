codeunit 50100 "CustomFieldFlow"
{

    //Transfer CustomField from Purchase Header → Item Journal Line
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnBeforeItemJnlLineInsert(var Rec: Record "Item Journal Line")
    var
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
    begin
        if PurchLine.Get(Rec."Document Type", Rec."Document No.", Rec."Line No.") then begin
            if PurchHeader.Get(PurchLine."Document Type", PurchLine."Document No.") then begin
                Rec."CustomField" := PurchHeader."CustomField";
            end;
        end;
    end;

    // Transfer CustomField from Item Journal Line → Item Ledger Entry
    [EventSubscriber(ObjectType::Table, Database::"Item Ledger Entry", 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnBeforeItemLedgEntryInsert(var Rec: Record "Item Ledger Entry")
    var
        ItemJnlLine: Record "Item Journal Line";
    begin
        if ItemJnlLine.Get(Rec."Document No.", Rec."Document Line No.") then begin
            Rec."CustomField" := ItemJnlLine."CustomField";
        end;
    end;
}
