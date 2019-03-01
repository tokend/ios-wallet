// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct ManageOfferOp
//  {
//      //: Balance for base asset of offer maker
//      BalanceID baseBalance; 
//      
//      //: Balance for quote asset of offer maker
//      BalanceID quoteBalance; 
//      
//      //: Direction of the offer
//      bool isBuy;
//      
//      //: Amount in base asset to buy or sell. If set to 0 - deletes the offer
//      int64 amount; 
//      
//      //: Price of base asset in terms of quote asset
//      int64 price;
//      
//      //: Fee in quote asset to pay 
//      int64 fee;
//      
//      //: ID of the offer to manage. 0 to create a new offer, otherwise edit an existing offer
//      uint64 offerID;
//      
//      //: ID of the orderBook to find match or to put offer in.
//      uint64 orderBookID;
//       
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//              void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct ManageOfferOp: XDREncodable {
  public var baseBalance: BalanceID
  public var quoteBalance: BalanceID
  public var isBuy: Bool
  public var amount: Int64
  public var price: Int64
  public var fee: Int64
  public var offerID: Uint64
  public var orderBookID: Uint64
  public var ext: ManageOfferOpExt

  public init(
      baseBalance: BalanceID,
      quoteBalance: BalanceID,
      isBuy: Bool,
      amount: Int64,
      price: Int64,
      fee: Int64,
      offerID: Uint64,
      orderBookID: Uint64,
      ext: ManageOfferOpExt) {

    self.baseBalance = baseBalance
    self.quoteBalance = quoteBalance
    self.isBuy = isBuy
    self.amount = amount
    self.price = price
    self.fee = fee
    self.offerID = offerID
    self.orderBookID = orderBookID
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.baseBalance.toXDR())
    xdr.append(self.quoteBalance.toXDR())
    xdr.append(self.isBuy.toXDR())
    xdr.append(self.amount.toXDR())
    xdr.append(self.price.toXDR())
    xdr.append(self.fee.toXDR())
    xdr.append(self.offerID.toXDR())
    xdr.append(self.orderBookID.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum ManageOfferOpExt: XDRDiscriminatedUnion {
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
