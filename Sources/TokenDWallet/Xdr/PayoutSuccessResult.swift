// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct PayoutSuccessResult
//  {
//      PayoutResponse payoutResponses<>;
//      uint64 actualPayoutAmount;
//      Fee actualFee;
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
public struct PayoutSuccessResult: XDREncodable {
  public var payoutResponses: [PayoutResponse]
  public var actualPayoutAmount: Uint64
  public var actualFee: Fee
  public var ext: PayoutSuccessResultExt

  public init(
      payoutResponses: [PayoutResponse],
      actualPayoutAmount: Uint64,
      actualFee: Fee,
      ext: PayoutSuccessResultExt) {

    self.payoutResponses = payoutResponses
    self.actualPayoutAmount = actualPayoutAmount
    self.actualFee = actualFee
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.payoutResponses.toXDR())
    xdr.append(self.actualPayoutAmount.toXDR())
    xdr.append(self.actualFee.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum PayoutSuccessResultExt: XDRDiscriminatedUnion {
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
