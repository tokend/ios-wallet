// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct LedgerHeaderHistoryEntry
//  {
//      Hash hash;
//      LedgerHeader header;
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
public struct LedgerHeaderHistoryEntry: XDRCodable {
  public var hash: Hash
  public var header: LedgerHeader
  public var ext: LedgerHeaderHistoryEntryExt

  public init(
      hash: Hash,
      header: LedgerHeader,
      ext: LedgerHeaderHistoryEntryExt) {

    self.hash = hash
    self.header = header
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.hash.toXDR())
    xdr.append(self.header.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.hash = try Hash(xdrData: &xdrData)
    self.header = try LedgerHeader(xdrData: &xdrData)
    self.ext = try LedgerHeaderHistoryEntryExt(xdrData: &xdrData)
  }

  public enum LedgerHeaderHistoryEntryExt: XDRDiscriminatedUnion {
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
