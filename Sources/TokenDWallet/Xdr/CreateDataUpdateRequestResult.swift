// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union CreateDataUpdateRequestResult switch (CreateDataUpdateRequestResultCode code)
//  {
//  case SUCCESS:
//      CreateDataUpdateRequestSuccess success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum CreateDataUpdateRequestResult: XDRDiscriminatedUnion {
  case success(CreateDataUpdateRequestSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return CreateDataUpdateRequestResultCode.success.rawValue
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
    case CreateDataUpdateRequestResultCode.success.rawValue:
      let data = try CreateDataUpdateRequestSuccess(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}