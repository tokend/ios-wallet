// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union ManageAssetResult switch (ManageAssetResultCode code)
//  {
//  case SUCCESS:
//      //: Result of successful operation applying
//      ManageAssetSuccess success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum ManageAssetResult: XDRDiscriminatedUnion {
  case success(ManageAssetSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageAssetResultCode.success.rawValue
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