// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union CreateDataOwnerUpdateRequestResult switch (CreateDataOwnerUpdateRequestResultCode code)
//  {
//  case SUCCESS:
//      CreateDataOwnerUpdateRequestSuccess success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum CreateDataOwnerUpdateRequestResult: XDRDiscriminatedUnion {
  case success(CreateDataOwnerUpdateRequestSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return CreateDataOwnerUpdateRequestResultCode.success.rawValue
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
    case CreateDataOwnerUpdateRequestResultCode.success.rawValue:
      let data = try CreateDataOwnerUpdateRequestSuccess(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}