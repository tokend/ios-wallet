// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of `CreateRedemptionRequest` operation application along with the result code
//  union CreateRedemptionRequestResult switch (CreateRedemptionRequestResultCode code)
//  {
//      case SUCCESS:
//          RedemptionRequestResponse redemptionResponse;
//      default:
//          void;
//  };

//  ===========================================================================
public enum CreateRedemptionRequestResult: XDRDiscriminatedUnion {
  case success(RedemptionRequestResponse)

  public var discriminant: Int32 {
    switch self {
    case .success: return CreateRedemptionRequestResultCode.success.rawValue
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

  public init(xdrData: inout Data) throws {
    let discriminant = try Int32(xdrData: &xdrData)

    switch discriminant {
    case CreateRedemptionRequestResultCode.success.rawValue:
      let data = try RedemptionRequestResponse(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}