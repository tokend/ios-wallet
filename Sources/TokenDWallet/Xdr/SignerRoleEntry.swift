// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct SignerRoleEntry
//  {
//      uint64 id;
//      uint64 ruleIDs<>;
//  
//      AccountID ownerID;
//  
//      longstring details;
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
public struct SignerRoleEntry: XDRCodable {
  public var id: Uint64
  public var ruleIDs: [Uint64]
  public var ownerID: AccountID
  public var details: Longstring
  public var ext: SignerRoleEntryExt

  public init(
      id: Uint64,
      ruleIDs: [Uint64],
      ownerID: AccountID,
      details: Longstring,
      ext: SignerRoleEntryExt) {

    self.id = id
    self.ruleIDs = ruleIDs
    self.ownerID = ownerID
    self.details = details
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.id.toXDR())
    xdr.append(self.ruleIDs.toXDR())
    xdr.append(self.ownerID.toXDR())
    xdr.append(self.details.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.id = try Uint64(xdrData: &xdrData)
    let lengthruleIDs = try Int32(xdrData: &xdrData)
    self.ruleIDs = [Uint64]()
    for _ in 1...lengthruleIDs {
      self.ruleIDs.append(try Uint64(xdrData: &xdrData))
    }
    self.ownerID = try AccountID(xdrData: &xdrData)
    self.details = try Longstring(xdrData: &xdrData)
    self.ext = try SignerRoleEntryExt(xdrData: &xdrData)
  }

  public enum SignerRoleEntryExt: XDRDiscriminatedUnion {
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
