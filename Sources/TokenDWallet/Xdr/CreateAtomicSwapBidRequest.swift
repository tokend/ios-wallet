// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CreateAtomicSwapBidRequest is used to create atomic swap bid request with passed fields
//  struct CreateAtomicSwapBidRequest
//  {
//      //: ID of existing bid
//      uint64 askID;
//      //: Amount in base asset to ask
//      uint64 baseAmount;
//      //: Code of asset which will be used to ask base asset
//      AssetCode quoteAsset;
//      //: Arbitrary stringified json object provided by a requester
//      longstring creatorDetails; // details set by requester
//  
//      //: reserved for the future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct CreateAtomicSwapBidRequest: XDREncodable {
  public var askID: Uint64
  public var baseAmount: Uint64
  public var quoteAsset: AssetCode
  public var creatorDetails: Longstring
  public var ext: CreateAtomicSwapBidRequestExt

  public init(
      askID: Uint64,
      baseAmount: Uint64,
      quoteAsset: AssetCode,
      creatorDetails: Longstring,
      ext: CreateAtomicSwapBidRequestExt) {

    self.askID = askID
    self.baseAmount = baseAmount
    self.quoteAsset = quoteAsset
    self.creatorDetails = creatorDetails
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.askID.toXDR())
    xdr.append(self.baseAmount.toXDR())
    xdr.append(self.quoteAsset.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum CreateAtomicSwapBidRequestExt: XDRDiscriminatedUnion {
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