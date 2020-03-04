// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of applying the review request with result code
//  union ReviewRequestResult switch (ReviewRequestResultCode code)
//  {
//  case SUCCESS:
//      ExtendedResult success;
//  case MANAGE_OFFER_FAILED:
//      ManageOfferResultCode manageOfferCode;
//  case PAYMENT_FAILED:
//      PaymentResultCode paymentCode;
//  default:
//      void;
//  };

//  ===========================================================================
public enum ReviewRequestResult: XDRDiscriminatedUnion {
  case success(ExtendedResult)
  case manageOfferFailed(ManageOfferResultCode)
  case paymentFailed(PaymentResultCode)

  public var discriminant: Int32 {
    switch self {
    case .success: return ReviewRequestResultCode.success.rawValue
    case .manageOfferFailed: return ReviewRequestResultCode.manageOfferFailed.rawValue
    case .paymentFailed: return ReviewRequestResultCode.paymentFailed.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .success(let data): xdr.append(data.toXDR())
    case .manageOfferFailed(let data): xdr.append(data.toXDR())
    case .paymentFailed(let data): xdr.append(data.toXDR())
    }

    return xdr
  }

  public init(xdrData: inout Data) throws {
    let discriminant = try Int32(xdrData: &xdrData)

    switch discriminant {
    case ReviewRequestResultCode.success.rawValue:
      let data = try ExtendedResult(xdrData: &xdrData)
      self = .success(data)
    case ReviewRequestResultCode.manageOfferFailed.rawValue:
      let data = try ManageOfferResultCode(xdrData: &xdrData)
      self = .manageOfferFailed(data)
    case ReviewRequestResultCode.paymentFailed.rawValue:
      let data = try PaymentResultCode(xdrData: &xdrData)
      self = .paymentFailed(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}
