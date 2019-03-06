// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct WithdrawalRequest {
//      //: Balance to withdraw from
//      BalanceID balance; // balance id from which withdrawal will be performed
//      //: Amount to withdraw
//      uint64 amount; // amount to be withdrawn
//      //: Amount in stats quote asset 
//      uint64 universalAmount; // amount in stats asset
//      //: Total fee to pay, contains fixed amount and calculated percent of the withdrawn amount
//      Fee fee; // expected fee to be paid
//      //: Arbitrary stringified json object that can be used to attach data to be reviewed by the admin
//      longstring creatorDetails; // details set by requester
//      
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct WithdrawalRequest: XDREncodable {
  public var balance: BalanceID
  public var amount: Uint64
  public var universalAmount: Uint64
  public var fee: Fee
  public var creatorDetails: Longstring
  public var ext: WithdrawalRequestExt

  public init(
      balance: BalanceID,
      amount: Uint64,
      universalAmount: Uint64,
      fee: Fee,
      creatorDetails: Longstring,
      ext: WithdrawalRequestExt) {

    self.balance = balance
    self.amount = amount
    self.universalAmount = universalAmount
    self.fee = fee
    self.creatorDetails = creatorDetails
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.balance.toXDR())
    xdr.append(self.amount.toXDR())
    xdr.append(self.universalAmount.toXDR())
    xdr.append(self.fee.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum WithdrawalRequestExt: XDRDiscriminatedUnion {
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