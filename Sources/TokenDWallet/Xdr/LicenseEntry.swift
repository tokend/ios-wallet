// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct LicenseEntry
//  {
//      uint64 adminCount;
//      uint64 dueDate;
//      Hash ledgerHash;
//      Hash prevLicenseHash;
//      DecoratedSignature signatures<>;
//  
//       // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct LicenseEntry: XDREncodable {
  public var adminCount: Uint64
  public var dueDate: Uint64
  public var ledgerHash: Hash
  public var prevLicenseHash: Hash
  public var signatures: [DecoratedSignature]
  public var ext: LicenseEntryExt

  public init(
      adminCount: Uint64,
      dueDate: Uint64,
      ledgerHash: Hash,
      prevLicenseHash: Hash,
      signatures: [DecoratedSignature],
      ext: LicenseEntryExt) {

    self.adminCount = adminCount
    self.dueDate = dueDate
    self.ledgerHash = ledgerHash
    self.prevLicenseHash = prevLicenseHash
    self.signatures = signatures
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.adminCount.toXDR())
    xdr.append(self.dueDate.toXDR())
    xdr.append(self.ledgerHash.toXDR())
    xdr.append(self.prevLicenseHash.toXDR())
    xdr.append(self.signatures.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum LicenseEntryExt: XDRDiscriminatedUnion {
    case emptyVersion()

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion(): xdr.append(Data())
      }

      return xdr
    }

  }
}
