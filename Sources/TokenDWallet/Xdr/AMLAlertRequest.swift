// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct AMLAlertRequest {
//      //: Target balance to void tokens from
//      BalanceID balanceID;
//  
//      //: Amount to void
//      uint64 amount;
//  
//      //: Arbitrary stringified json object that can be used to attach data to be reviewed by the admin
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
public struct AMLAlertRequest: XDREncodable {
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

  public enum AMLAlertRequestExt: XDRDiscriminatedUnion {
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