// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CreateAccountSaleRuleData is used to pass necessary params to create a new account sale rule
//  struct CreateAccountSaleRuleData
//  {
//      //: Certain account for which rule is applied, null means rule is global
//      AccountID* accountID;
//      //: True if such rule is deniable, otherwise allows
//      bool forbids;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct CreateAccountSaleRuleData: XDRCodable {
  public var accountID: AccountID?
  public var forbids: Bool
  public var ext: CreateAccountSaleRuleDataExt

  public init(
      accountID: AccountID?,
      forbids: Bool,
      ext: CreateAccountSaleRuleDataExt) {

    self.accountID = accountID
    self.forbids = forbids
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.accountID.toXDR())
    xdr.append(self.forbids.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    if (try Bool(xdrData: &xdrData)) {
      self.accountID = try AccountID(xdrData: &xdrData)
    } else {
      self.accountID = nil
    }
    self.forbids = try Bool(xdrData: &xdrData)
    self.ext = try CreateAccountSaleRuleDataExt(xdrData: &xdrData)
  }

  public enum CreateAccountSaleRuleDataExt: XDRDiscriminatedUnion {
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
