// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union BucketEntry switch (BucketEntryType type)
//  {
//  case LIVEENTRY:
//      LedgerEntry liveEntry;
//  
//  case DEADENTRY:
//      LedgerKey deadEntry;
//  };

//  ===========================================================================
public enum BucketEntry: XDRDiscriminatedUnion {
  case liveentry(LedgerEntry)
  case deadentry(LedgerKey)

  public var discriminant: Int32 {
    switch self {
    case .liveentry: return BucketEntryType.liveentry.rawValue
    case .deadentry: return BucketEntryType.deadentry.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .liveentry(let data): xdr.append(data.toXDR())
    case .deadentry(let data): xdr.append(data.toXDR())
    }

    return xdr
  }
}