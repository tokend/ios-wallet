// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of ManageVoteOp application
//  union ManageVoteResult switch (ManageVoteResultCode code)
//  {
//  case SUCCESS:
//      EmptyExt ext;
//  default:
//      void;
//  };

//  ===========================================================================
public enum ManageVoteResult: XDRDiscriminatedUnion {
  case success(EmptyExt)

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageVoteResultCode.success.rawValue
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
    case ManageVoteResultCode.success.rawValue:
      let data = try EmptyExt(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}
