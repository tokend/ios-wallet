// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CreateAccountRoleData is used to pass necessary params to create a new account role
//  struct CreateAccountRoleData
//  {
//      //: Arbitrary stringified json object that will be attached to the role
//      longstring details;
//      //: Array of ids of existing unique rules
//      uint64 ruleIDs<>;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct CreateAccountRoleData: XDRCodable {
  public var details: Longstring
  public var ruleIDs: [Uint64]
  public var ext: CreateAccountRoleDataExt

  public init(
      details: Longstring,
      ruleIDs: [Uint64],
      ext: CreateAccountRoleDataExt) {

    self.details = details
    self.ruleIDs = ruleIDs
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.details.toXDR())
    xdr.append(self.ruleIDs.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.details = try Longstring(xdrData: &xdrData)
    let lengthruleIDs = try Int32(xdrData: &xdrData)
    self.ruleIDs = [Uint64]()
    for _ in 1...lengthruleIDs {
      self.ruleIDs.append(try Uint64(xdrData: &xdrData))
    }
    self.ext = try CreateAccountRoleDataExt(xdrData: &xdrData)
  }

  public enum CreateAccountRoleDataExt: XDRDiscriminatedUnion {
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
