// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of applying CreateWithdrawalRequst operation along with the result code
//  union CreateWithdrawalRequestResult switch (CreateWithdrawalRequestResultCode code)
//  {
//      case SUCCESS:
//          CreateWithdrawalSuccess success;
//      default:
//          void;
//  };

//  ===========================================================================
public enum CreateWithdrawalRequestResult: XDRDiscriminatedUnion {
  case success(CreateWithdrawalSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return CreateWithdrawalRequestResultCode.success.rawValue
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
    case CreateWithdrawalRequestResultCode.success.rawValue:
      let data = try CreateWithdrawalSuccess(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}
