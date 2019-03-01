// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct ManageAssetPairSuccess
//  {
//      //: Price of the asset pair after the operation
//      int64 currentPrice;
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct ManageAssetPairSuccess: XDREncodable {
  public var currentPrice: Int64
  public var ext: ManageAssetPairSuccessExt

  public init(
      currentPrice: Int64,
      ext: ManageAssetPairSuccessExt) {

    self.currentPrice = currentPrice
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.currentPrice.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum ManageAssetPairSuccessExt: XDRDiscriminatedUnion {
    case emptyVersion()

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion(): xdr.append(Data())
      }

      return xdr
    }

  }
}
