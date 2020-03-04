// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct StellarValue
//  {
//      Hash txSetHash;   // transaction set to apply to previous ledger
//      uint64 closeTime; // network close time
//  
//      // upgrades to apply to the previous ledger (usually empty)
//      // this is a vector of encoded 'LedgerUpgrade' so that nodes can drop
//      // unknown steps during consensus if needed.
//      // see notes below on 'LedgerUpgrade' for more detail
//      // max size is dictated by number of upgrade types (+ room for future)
//      UpgradeType upgrades<6>;
//  
//      // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct StellarValue: XDRCodable {
  public var txSetHash: Hash
  public var closeTime: Uint64
  public var upgrades: [UpgradeType]
  public var ext: StellarValueExt

  public init(
      txSetHash: Hash,
      closeTime: Uint64,
      upgrades: [UpgradeType],
      ext: StellarValueExt) {

    self.txSetHash = txSetHash
    self.closeTime = closeTime
    self.upgrades = upgrades
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.txSetHash.toXDR())
    xdr.append(self.closeTime.toXDR())
    xdr.append(self.upgrades.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.txSetHash = try Hash(xdrData: &xdrData)
    self.closeTime = try Uint64(xdrData: &xdrData)
    let lengthupgrades = try Int32(xdrData: &xdrData)
    self.upgrades = [UpgradeType]()
    for _ in 1...lengthupgrades {
      self.upgrades.append(try UpgradeType(xdrData: &xdrData))
    }
    self.ext = try StellarValueExt(xdrData: &xdrData)
  }

  public enum StellarValueExt: XDRDiscriminatedUnion {
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

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case LedgerVersion.emptyVersion.rawValue: self = .emptyVersion()
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
}
