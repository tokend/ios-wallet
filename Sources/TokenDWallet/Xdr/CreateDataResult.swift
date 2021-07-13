// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of operation application
//  union CreateDataResult switch (CreateDataResultCode code)
//  {
//      case SUCCESS:
//          //: Result of successful operation application
//          CreateDataSuccess success;
//      default:
//          void;
//  };

//  ===========================================================================
public enum CreateDataResult: XDRDiscriminatedUnion {
  case success(CreateDataSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return CreateDataResultCode.success.rawValue
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
    case CreateDataResultCode.success.rawValue:
      let data = try CreateDataSuccess(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}