// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Body of a reviewable AMLAlertRequest, contains parameters regarding AML alert
//  struct AMLAlertRequest {
//      //: Target balance to void tokens from
//      BalanceID balanceID;
//  
//      //: Amount to void
//      uint64 amount;
//  
//      //: Arbitrary stringified json object that can be used to attach data to be reviewed by an admin
//      longstring creatorDetails; // details set by requester
//  
//      //: Reserved for future use
//  	union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct AMLAlertRequest: XDRCodable {
  public var balanceID: BalanceID
  public var amount: Uint64
  public var creatorDetails: Longstring
  public var ext: AMLAlertRequestExt

  public init(
      balanceID: BalanceID,
      amount: Uint64,
      creatorDetails: Longstring,
      ext: AMLAlertRequestExt) {

    self.balanceID = balanceID
    self.amount = amount
    self.creatorDetails = creatorDetails
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.balanceID.toXDR())
    xdr.append(self.amount.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.balanceID = try BalanceID(xdrData: &xdrData)
    self.amount = try Uint64(xdrData: &xdrData)
    self.creatorDetails = try Longstring(xdrData: &xdrData)
    self.ext = try AMLAlertRequestExt(xdrData: &xdrData)
  }

  public enum AMLAlertRequestExt: XDRDiscriminatedUnion {
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
