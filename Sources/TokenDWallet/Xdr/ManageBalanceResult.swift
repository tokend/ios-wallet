// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union ManageBalanceResult switch (ManageBalanceResultCode code)
//  {
//  case SUCCESS:
//      ManageBalanceSuccess success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum ManageBalanceResult: XDRDiscriminatedUnion {
  case success(ManageBalanceSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageBalanceResultCode.success.rawValue
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
    case ManageBalanceResultCode.success.rawValue:
      let data = try ManageBalanceSuccess(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}
