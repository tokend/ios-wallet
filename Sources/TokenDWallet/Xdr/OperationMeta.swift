// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct OperationMeta
//  {
//      LedgerEntryChanges changes;
//  };

//  ===========================================================================
public struct OperationMeta: XDRCodable {
  public var changes: LedgerEntryChanges

  public init(
      changes: LedgerEntryChanges) {

    self.changes = changes
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.changes.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    let length = try Int32(xdrData: &xdrData)
    self.changes = LedgerEntryChanges()
    for _ in 1...length {
        self.changes.append(try LedgerEntryChange(xdrData: &xdrData))
    }
  }
}
