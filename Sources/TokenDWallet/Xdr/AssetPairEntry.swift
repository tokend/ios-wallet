// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct AssetPairEntry
//  {
//      AssetCode base;
//  	AssetCode quote;
//  
//      int64 currentPrice;
//      int64 physicalPrice;
//  
//  	int64 physicalPriceCorrection; // correction of physical price in percents. If physical price is set and restriction by physical price set, mininal price for offer for this pair will be physicalPrice * physicalPriceCorrection
//  	int64 maxPriceStep; // max price step in percent. User is allowed to set offer with price < (1 - maxPriceStep)*currentPrice and > (1 + maxPriceStep)*currentPrice
//  
//  
//  	int32 policies;
//  
//      // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct AssetPairEntry: XDREncodable {
  public var base: AssetCode
  public var quote: AssetCode
  public var currentPrice: Int64
  public var physicalPrice: Int64
  public var physicalPriceCorrection: Int64
  public var maxPriceStep: Int64
  public var policies: Int32
  public var ext: AssetPairEntryExt

  public init(
      base: AssetCode,
      quote: AssetCode,
      currentPrice: Int64,
      physicalPrice: Int64,
      physicalPriceCorrection: Int64,
      maxPriceStep: Int64,
      policies: Int32,
      ext: AssetPairEntryExt) {

    self.base = base
    self.quote = quote
    self.currentPrice = currentPrice
    self.physicalPrice = physicalPrice
    self.physicalPriceCorrection = physicalPriceCorrection
    self.maxPriceStep = maxPriceStep
    self.policies = policies
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.base.toXDR())
    xdr.append(self.quote.toXDR())
    xdr.append(self.currentPrice.toXDR())
    xdr.append(self.physicalPrice.toXDR())
    xdr.append(self.physicalPriceCorrection.toXDR())
    xdr.append(self.maxPriceStep.toXDR())
    xdr.append(self.policies.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum AssetPairEntryExt: XDRDiscriminatedUnion {
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
