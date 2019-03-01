// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union RequestTypedResource switch (ReviewableRequestType requestType)
//  {
//  case CREATE_SALE:
//      struct
//      {
//          uint64 type;
//  
//          EmptyExt ext;
//      } sale;
//  case CREATE_ISSUANCE:
//      struct
//      {
//          AssetCode assetCode;
//          uint64 assetType;
//  
//          EmptyExt ext;
//      } issuance;
//  case CREATE_WITHDRAW:
//      struct
//      {
//          AssetCode assetCode;
//          uint64 assetType;
//  
//          EmptyExt ext;
//      } withdraw;
//  default:
//      EmptyExt ext;
//  };

//  ===========================================================================
public enum RequestTypedResource: XDRDiscriminatedUnion {
  case createSale(RequestTypedResourceSale)
  case createIssuance(RequestTypedResourceIssuance)
  case createWithdraw(RequestTypedResourceWithdraw)

  public var discriminant: Int32 {
    switch self {
    case .createSale: return ReviewableRequestType.createSale.rawValue
    case .createIssuance: return ReviewableRequestType.createIssuance.rawValue
    case .createWithdraw: return ReviewableRequestType.createWithdraw.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .createSale(let data): xdr.append(data.toXDR())
    case .createIssuance(let data): xdr.append(data.toXDR())
    case .createWithdraw(let data): xdr.append(data.toXDR())
    }

    return xdr
  }
  public struct RequestTypedResourceSale: XDREncodable {
    public var type: Uint64
    public var ext: EmptyExt

    public init(
        type: Uint64,
        ext: EmptyExt) {

      self.type = type
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.type.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct RequestTypedResourceIssuance: XDREncodable {
    public var assetCode: AssetCode
    public var assetType: Uint64
    public var ext: EmptyExt

    public init(
        assetCode: AssetCode,
        assetType: Uint64,
        ext: EmptyExt) {

      self.assetCode = assetCode
      self.assetType = assetType
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.assetCode.toXDR())
      xdr.append(self.assetType.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
  public struct RequestTypedResourceWithdraw: XDREncodable {
    public var assetCode: AssetCode
    public var assetType: Uint64
    public var ext: EmptyExt

    public init(
        assetCode: AssetCode,
        assetType: Uint64,
        ext: EmptyExt) {

      self.assetCode = assetCode
      self.assetType = assetType
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.assetCode.toXDR())
      xdr.append(self.assetType.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

  }
}
