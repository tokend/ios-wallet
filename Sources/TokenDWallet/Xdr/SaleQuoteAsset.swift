// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct SaleQuoteAsset {
//  	AssetCode quoteAsset; // asset in which participation will be accepted
//  	uint64 price; // price for 1 baseAsset in terms of quote asset
//  	BalanceID quoteBalance;
//  	uint64 currentCap; // current capitalization
//  	union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct SaleQuoteAsset: XDREncodable {
  public var quoteAsset: AssetCode
  public var price: Uint64
  public var quoteBalance: BalanceID
  public var currentCap: Uint64
  public var ext: SaleQuoteAssetExt

  public init(
      quoteAsset: AssetCode,
      price: Uint64,
      quoteBalance: BalanceID,
      currentCap: Uint64,
      ext: SaleQuoteAssetExt) {

    self.quoteAsset = quoteAsset
    self.price = price
    self.quoteBalance = quoteBalance
    self.currentCap = currentCap
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.quoteAsset.toXDR())
    xdr.append(self.price.toXDR())
    xdr.append(self.quoteBalance.toXDR())
    xdr.append(self.currentCap.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum SaleQuoteAssetExt: XDRDiscriminatedUnion {
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