// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of operation application
//  union BindExternalSystemAccountIdResult switch (BindExternalSystemAccountIdResultCode code)
//  {
//  case SUCCESS:
//      //: `success` is used to pass useful fields after successful operation applying
//      BindExternalSystemAccountIdSuccess success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum BindExternalSystemAccountIdResult: XDRDiscriminatedUnion {
  case success(BindExternalSystemAccountIdSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return BindExternalSystemAccountIdResultCode.success.rawValue
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
    case BindExternalSystemAccountIdResultCode.success.rawValue:
      let data = try BindExternalSystemAccountIdSuccess(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}
