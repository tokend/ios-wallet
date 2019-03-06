// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union ReviewableRequestResource switch (ReviewableRequestType requestType)
//  {
//  case CREATE_SALE:
//      //: is used to restrict using of reviewable request with create_sale type
//      struct
//      {
//          //: type of sale
//          uint64 type;
//  
//          //: reserved for future extension
//          EmptyExt ext;
//      } createSale;
//  case CREATE_ISSUANCE:
//      //: is used to restrict using of reviewable request with create_issuance type
//      struct
//      {
//          //: code of asset
//          AssetCode assetCode;
//          //: type of asset
//          uint64 assetType;
//  
//          //: reserved for future extension
//          EmptyExt ext;
//      } createIssuance;
//  case CREATE_WITHDRAW:
//      //: is used to restrict using of reviewable request with create_withdraw type
//      struct
//      {
//          //: code of asset
//          AssetCode assetCode;
//          //: type of asset
//          uint64 assetType;
//  
//          //: reserved for future extension
//          EmptyExt ext;
//      } createWithdraw;
//  default:
//      //: reserved for future extension
//      EmptyExt ext;
//  };

//  ===========================================================================
public enum ReviewableRequestResource: XDRDiscriminatedUnion {
  case createSale(ReviewableRequestResourceCreateSale)
  case createIssuance(ReviewableRequestResourceCreateIssuance)
  case createWithdraw(ReviewableRequestResourceCreateWithdraw)

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
  public struct ReviewableRequestResourceCreateSale: XDREncodable {
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
  public struct ReviewableRequestResourceCreateIssuance: XDREncodable {
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
  public struct ReviewableRequestResourceCreateWithdraw: XDREncodable {
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