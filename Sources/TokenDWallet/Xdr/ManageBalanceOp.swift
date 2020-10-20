// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: `ManageBalanceOp` applies an `action` of the `ManageBalanceAction` type on the balance of a particular `asset` (referenced to by its AssetCode)
//  //: of the `destination` account (referenced to by its AccountID)
//  struct ManageBalanceOp
//  {
//      //: Defines a ManageBalanceAction to be performed. `DELETE_BALANCE` is reserved and not implemented yet.
//      ManageBalanceAction action;
//      //: Defines an account whose balance will be managed
//      AccountID destination;
//      //: Defines an asset code of the balance to which `action` will be applied
//      AssetCode asset;
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct ManageBalanceOp: XDRCodable {
  public var action: ManageBalanceAction
  public var destination: AccountID
  public var asset: AssetCode
  public var ext: ManageBalanceOpExt

  public init(
      action: ManageBalanceAction,
      destination: AccountID,
      asset: AssetCode,
      ext: ManageBalanceOpExt) {

    self.action = action
    self.destination = destination
    self.asset = asset
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.action.toXDR())
    xdr.append(self.destination.toXDR())
    xdr.append(self.asset.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.action = try ManageBalanceAction(xdrData: &xdrData)
    self.destination = try AccountID(xdrData: &xdrData)
    self.asset = try AssetCode(xdrData: &xdrData)
    self.ext = try ManageBalanceOpExt(xdrData: &xdrData)
  }

  public enum ManageBalanceOpExt: XDRDiscriminatedUnion {
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
