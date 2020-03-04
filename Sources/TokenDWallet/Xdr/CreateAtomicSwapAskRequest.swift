// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CreateAtomicSwapAskRequest is used to create atomic swap ask entry with passed fields
//  struct CreateAtomicSwapAskRequest
//  {
//      //: ID of balance with base asset
//      BalanceID baseBalance;
//      //: Amount to be sold through atomic swaps
//      uint64 amount;
//      //: Arbitrary stringified json object provided by a requester
//      longstring creatorDetails; // details set by requester
//      //: Array of assets with price which can be used to ask base asset
//      AtomicSwapAskQuoteAsset quoteAssets<>;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct CreateAtomicSwapAskRequest: XDRCodable {
  public var baseBalance: BalanceID
  public var amount: Uint64
  public var creatorDetails: Longstring
  public var quoteAssets: [AtomicSwapAskQuoteAsset]
  public var ext: CreateAtomicSwapAskRequestExt

  public init(
      baseBalance: BalanceID,
      amount: Uint64,
      creatorDetails: Longstring,
      quoteAssets: [AtomicSwapAskQuoteAsset],
      ext: CreateAtomicSwapAskRequestExt) {

    self.baseBalance = baseBalance
    self.amount = amount
    self.creatorDetails = creatorDetails
    self.quoteAssets = quoteAssets
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.baseBalance.toXDR())
    xdr.append(self.amount.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.quoteAssets.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.baseBalance = try BalanceID(xdrData: &xdrData)
    self.amount = try Uint64(xdrData: &xdrData)
    self.creatorDetails = try Longstring(xdrData: &xdrData)
    let lengthquoteAssets = try Int32(xdrData: &xdrData)
    self.quoteAssets = [AtomicSwapAskQuoteAsset]()
    for _ in 1...lengthquoteAssets {
      self.quoteAssets.append(try AtomicSwapAskQuoteAsset(xdrData: &xdrData))
    }
    self.ext = try CreateAtomicSwapAskRequestExt(xdrData: &xdrData)
  }

  public enum CreateAtomicSwapAskRequestExt: XDRDiscriminatedUnion {
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

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case LedgerVersion.emptyVersion.rawValue: self = .emptyVersion()
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
}
