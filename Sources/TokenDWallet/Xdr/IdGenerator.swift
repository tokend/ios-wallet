// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct IdGenerator {
//  	LedgerEntryType entryType; // type of the entry, for which ids will be generated
//  	uint64 idPool; // last used entry specific ID, used for generating entry of specified type
//  };

//  ===========================================================================
public struct IdGenerator: XDREncodable {
  public var entryType: LedgerEntryType
  public var idPool: Uint64

  public init(
      entryType: LedgerEntryType,
      idPool: Uint64) {

    self.entryType = entryType
    self.idPool = idPool
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.entryType.toXDR())
    xdr.append(self.idPool.toXDR())

    return xdr
  }
}