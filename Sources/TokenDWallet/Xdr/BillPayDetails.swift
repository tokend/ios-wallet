// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct BillPayDetails {
//      //: Details of payment
//      PaymentOp paymentDetails;
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
public struct BillPayDetails: XDREncodable {
  public var paymentDetails: PaymentOp
  public var ext: BillPayDetailsExt

  public init(
      paymentDetails: PaymentOp,
      ext: BillPayDetailsExt) {

    self.paymentDetails = paymentDetails
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.paymentDetails.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum BillPayDetailsExt: XDRDiscriminatedUnion {
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
