// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union ManageSignerResult switch (ManageSignerResultCode code)
//  {
//  case SUCCESS:
//      //: reserved for future extension
//      EmptyExt ext;
//  default:
//      void;
//  };

//  ===========================================================================
public enum ManageSignerResult: XDRDiscriminatedUnion {
  case success(EmptyExt)

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageSignerResultCode.success.rawValue
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
