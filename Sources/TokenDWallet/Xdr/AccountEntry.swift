// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct AccountEntry
//  {
//      AccountID accountID;      // master public key for this account
//  
//      // Referral marketing
//      AccountID* referrer; // parent account
//  
//      // sequenctial ID - unique identifier of the account, used by ingesting applications to
//      // identify account, while keeping size of index small
//      uint64 sequentialID;
//  
//  	uint64 roleID;
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
public struct AccountEntry: XDRCodable {
  public var accountID: AccountID
  public var referrer: AccountID?
  public var sequentialID: Uint64
  public var roleID: Uint64
  public var ext: AccountEntryExt

  public init(
      accountID: AccountID,
      referrer: AccountID?,
      sequentialID: Uint64,
      roleID: Uint64,
      ext: AccountEntryExt) {

    self.accountID = accountID
    self.referrer = referrer
    self.sequentialID = sequentialID
    self.roleID = roleID
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.accountID.toXDR())
    xdr.append(self.referrer.toXDR())
    xdr.append(self.sequentialID.toXDR())
    xdr.append(self.roleID.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.accountID = try AccountID(xdrData: &xdrData)
    if (try Bool(xdrData: &xdrData)) {
      self.referrer = try AccountID(xdrData: &xdrData)
    } else {
      self.referrer = nil
    }
    self.sequentialID = try Uint64(xdrData: &xdrData)
    self.roleID = try Uint64(xdrData: &xdrData)
    self.ext = try AccountEntryExt(xdrData: &xdrData)
  }

  public enum AccountEntryExt: XDRDiscriminatedUnion {
    case emptyVersion

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion: xdr.append(Data())
      }

      return xdr
    }

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case LedgerVersion.emptyVersion.rawValue: self = .emptyVersion
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
}
