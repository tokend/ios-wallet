// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct CreateAccountRoleData
//  {
//      //: Arbitrary stringified json object that will be attached to role
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
public struct CreateAccountRoleData: XDREncodable {
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

  public enum CreateAccountRoleDataExt: XDRDiscriminatedUnion {
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
