// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of CancelDataUpdateRequest operation application along with the result code
//  union CancelDataUpdateRequestResult switch (CancelDataUpdateRequestResultCode code)
//  {
//      case SUCCESS:
//          CancelDataUpdateSuccess success;
//      default:
//          void;
//  };

//  ===========================================================================
public enum CancelDataUpdateRequestResult: XDRDiscriminatedUnion {
  case success(CancelDataUpdateSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return CancelDataUpdateRequestResultCode.success.rawValue
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
    case CancelDataUpdateRequestResultCode.success.rawValue:
      let data = try CancelDataUpdateSuccess(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}