// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: StampResult is a result of Stamp operation application
//  union StampResult switch (StampResultCode code)
//  {
//  case SUCCESS:
//      StampSuccess success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum StampResult: XDRDiscriminatedUnion {
  case success(StampSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return StampResultCode.success.rawValue
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
    case StampResultCode.success.rawValue:
      let data = try StampSuccess(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}
