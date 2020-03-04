// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct ExternalSystemAccountIDPoolEntry
//  {
//      uint64 poolEntryID;
//      int32 externalSystemType;
//      longstring data;
//      AccountID* accountID;
//      uint64 expiresAt;
//      uint64 bindedAt;
//      uint64 parent;
//      bool isDeleted;
//  
//  
//      // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//         void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct ExternalSystemAccountIDPoolEntry: XDRCodable {
  public var poolEntryID: Uint64
  public var externalSystemType: Int32
  public var data: Longstring
  public var accountID: AccountID?
  public var expiresAt: Uint64
  public var bindedAt: Uint64
  public var parent: Uint64
  public var isDeleted: Bool
  public var ext: ExternalSystemAccountIDPoolEntryExt

  public init(
      poolEntryID: Uint64,
      externalSystemType: Int32,
      data: Longstring,
      accountID: AccountID?,
      expiresAt: Uint64,
      bindedAt: Uint64,
      parent: Uint64,
      isDeleted: Bool,
      ext: ExternalSystemAccountIDPoolEntryExt) {

    self.poolEntryID = poolEntryID
    self.externalSystemType = externalSystemType
    self.data = data
    self.accountID = accountID
    self.expiresAt = expiresAt
    self.bindedAt = bindedAt
    self.parent = parent
    self.isDeleted = isDeleted
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.poolEntryID.toXDR())
    xdr.append(self.externalSystemType.toXDR())
    xdr.append(self.data.toXDR())
    xdr.append(self.accountID.toXDR())
    xdr.append(self.expiresAt.toXDR())
    xdr.append(self.bindedAt.toXDR())
    xdr.append(self.parent.toXDR())
    xdr.append(self.isDeleted.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.poolEntryID = try Uint64(xdrData: &xdrData)
    self.externalSystemType = try Int32(xdrData: &xdrData)
    self.data = try Longstring(xdrData: &xdrData)
    if (try Bool(xdrData: &xdrData)) {
      self.accountID = try AccountID(xdrData: &xdrData)
    } else {
      self.accountID = nil
    }
    self.expiresAt = try Uint64(xdrData: &xdrData)
    self.bindedAt = try Uint64(xdrData: &xdrData)
    self.parent = try Uint64(xdrData: &xdrData)
    self.isDeleted = try Bool(xdrData: &xdrData)
    self.ext = try ExternalSystemAccountIDPoolEntryExt(xdrData: &xdrData)
  }

  public enum ExternalSystemAccountIDPoolEntryExt: XDRDiscriminatedUnion {
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
