// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union PayoutResult switch (PayoutResultCode code)
//  {
//      case SUCCESS:
//          PayoutSuccessResult success;
//      default:
//          void;
//  };

//  ===========================================================================
public enum PayoutResult: XDRDiscriminatedUnion {
  case success(PayoutSuccessResult)

  public var discriminant: Int32 {
    switch self {
    case .success: return PayoutResultCode.success.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .success(let data): xdr.append(data.toXDR())
    }

    return xdr
  }
}