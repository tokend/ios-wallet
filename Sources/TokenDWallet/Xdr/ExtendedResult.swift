// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Extended result of a Review Request operation containing details specific to certain request types
//  struct ExtendedResult {
//      //: Indicates whether or not the request that is being reviewed was applied
//      bool fulfilled;
//      //: typeExt is used to pass ReviewableRequestType along with details specific to a request type
//      union switch(ReviewableRequestType requestType) {
//      case CREATE_SALE:
//          SaleExtended saleExtended;
//      case NONE:
//          void;
//      case CREATE_ATOMIC_SWAP_BID:
//          AtomicSwapBidExtended atomicSwapBidExtended;
//      case CREATE_ATOMIC_SWAP_ASK:
//          AtomicSwapAskExtended atomicSwapAskExtended;
//      case CREATE_POLL:
//          CreatePollExtended createPoll;
//      case MANAGE_OFFER:
//          ManageOfferResult manageOfferResult;
//      case CREATE_PAYMENT:
//          PaymentResult paymentResult;
//      case PERFORM_REDEMPTION:
//          CreateRedemptionRequestResult createRedemptionResult;
//      case DATA_CREATION:
//          DataCreationExtended dataCreationExtended;
//      case CREATE_DEFERRED_PAYMENT:
//          CreateDeferredPaymentResult createDeferredPaymentResult;
//      case CLOSE_DEFERRED_PAYMENT:
//           CloseDeferredPaymentResult closeDeferredPaymentResult;
//  
//      } typeExt;
//  
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct ExtendedResult: XDRCodable {
  public var fulfilled: Bool
  public var typeExt: ExtendedResultTypeExt
  public var ext: ExtendedResultExt

  public init(
      fulfilled: Bool,
      typeExt: ExtendedResultTypeExt,
      ext: ExtendedResultExt) {

    self.fulfilled = fulfilled
    self.typeExt = typeExt
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.fulfilled.toXDR())
    xdr.append(self.typeExt.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.fulfilled = try Bool(xdrData: &xdrData)
    self.typeExt = try ExtendedResultTypeExt(xdrData: &xdrData)
    self.ext = try ExtendedResultExt(xdrData: &xdrData)
  }

  public enum ExtendedResultTypeExt: XDRDiscriminatedUnion {
    case createSale(SaleExtended)
    case none
    case createAtomicSwapBid(AtomicSwapBidExtended)
    case createAtomicSwapAsk(AtomicSwapAskExtended)
    case createPoll(CreatePollExtended)
    case manageOffer(ManageOfferResult)
    case createPayment(PaymentResult)
    case performRedemption(CreateRedemptionRequestResult)
    case dataCreation(DataCreationExtended)
    case createDeferredPayment(CreateDeferredPaymentResult)
    case closeDeferredPayment(CloseDeferredPaymentResult)

    public var discriminant: Int32 {
      switch self {
      case .createSale: return ReviewableRequestType.createSale.rawValue
      case .none: return ReviewableRequestType.none.rawValue
      case .createAtomicSwapBid: return ReviewableRequestType.createAtomicSwapBid.rawValue
      case .createAtomicSwapAsk: return ReviewableRequestType.createAtomicSwapAsk.rawValue
      case .createPoll: return ReviewableRequestType.createPoll.rawValue
      case .manageOffer: return ReviewableRequestType.manageOffer.rawValue
      case .createPayment: return ReviewableRequestType.createPayment.rawValue
      case .performRedemption: return ReviewableRequestType.performRedemption.rawValue
      case .dataCreation: return ReviewableRequestType.dataCreation.rawValue
      case .createDeferredPayment: return ReviewableRequestType.createDeferredPayment.rawValue
      case .closeDeferredPayment: return ReviewableRequestType.closeDeferredPayment.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .createSale(let data): xdr.append(data.toXDR())
      case .none: xdr.append(Data())
      case .createAtomicSwapBid(let data): xdr.append(data.toXDR())
      case .createAtomicSwapAsk(let data): xdr.append(data.toXDR())
      case .createPoll(let data): xdr.append(data.toXDR())
      case .manageOffer(let data): xdr.append(data.toXDR())
      case .createPayment(let data): xdr.append(data.toXDR())
      case .performRedemption(let data): xdr.append(data.toXDR())
      case .dataCreation(let data): xdr.append(data.toXDR())
      case .createDeferredPayment(let data): xdr.append(data.toXDR())
      case .closeDeferredPayment(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case ReviewableRequestType.createSale.rawValue:
        let data = try SaleExtended(xdrData: &xdrData)
        self = .createSale(data)
      case ReviewableRequestType.none.rawValue: self = .none
      case ReviewableRequestType.createAtomicSwapBid.rawValue:
        let data = try AtomicSwapBidExtended(xdrData: &xdrData)
        self = .createAtomicSwapBid(data)
      case ReviewableRequestType.createAtomicSwapAsk.rawValue:
        let data = try AtomicSwapAskExtended(xdrData: &xdrData)
        self = .createAtomicSwapAsk(data)
      case ReviewableRequestType.createPoll.rawValue:
        let data = try CreatePollExtended(xdrData: &xdrData)
        self = .createPoll(data)
      case ReviewableRequestType.manageOffer.rawValue:
        let data = try ManageOfferResult(xdrData: &xdrData)
        self = .manageOffer(data)
      case ReviewableRequestType.createPayment.rawValue:
        let data = try PaymentResult(xdrData: &xdrData)
        self = .createPayment(data)
      case ReviewableRequestType.performRedemption.rawValue:
        let data = try CreateRedemptionRequestResult(xdrData: &xdrData)
        self = .performRedemption(data)
      case ReviewableRequestType.dataCreation.rawValue:
        let data = try DataCreationExtended(xdrData: &xdrData)
        self = .dataCreation(data)
      case ReviewableRequestType.createDeferredPayment.rawValue:
        let data = try CreateDeferredPaymentResult(xdrData: &xdrData)
        self = .createDeferredPayment(data)
      case ReviewableRequestType.closeDeferredPayment.rawValue:
        let data = try CloseDeferredPaymentResult(xdrData: &xdrData)
        self = .closeDeferredPayment(data)
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
  public enum ExtendedResultExt: XDRDiscriminatedUnion {
    case emptyVersion

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion: xdr.append(Data())
      }

      return xdr
    }

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case LedgerVersion.emptyVersion.rawValue: self = .emptyVersion
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
}
