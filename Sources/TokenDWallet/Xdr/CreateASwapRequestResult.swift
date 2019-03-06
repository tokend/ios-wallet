// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union CreateASwapRequestResult switch (CreateASwapRequestResultCode code)
//  {
//  case SUCCESS:
//      CreateASwapRequestSuccess success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum CreateASwapRequestResult: XDRDiscriminatedUnion {
  case success(CreateASwapRequestSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return CreateASwapRequestResultCode.success.rawValue
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