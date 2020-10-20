// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Review Request operation
//  struct ReviewRequestOp
//  {
//      //: ID of a request that is being reviewed
//      uint64 requestID;
//      //: Hash of a request that is being reviewed
//      Hash requestHash;
//      //: requestDetails is used to pass request type along with details specific to it.
//      union switch(ReviewableRequestType requestType) {
//      case CREATE_WITHDRAW:
//          WithdrawalDetails withdrawal;
//      case UPDATE_LIMITS:
//          LimitsUpdateDetails limitsUpdate;
//      case CREATE_AML_ALERT:
//          AMLAlertDetails amlAlertDetails;
//      case CREATE_INVOICE:
//          BillPayDetails billPay;
//      case MANAGE_CONTRACT:
//          ContractDetails contract;
//      default:
//          void;
//      } requestDetails;
//      //: Review action defines an action performed on the pending ReviewableRequest
//      ReviewRequestOpAction action;
//      //: Contains reject reason
//      longstring reason;
//      //: Details of the ReviewRequest operation
//      ReviewDetails reviewDetails;
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
public struct ReviewRequestOp: XDRCodable {
  public var requestID: Uint64
  public var requestHash: Hash
  public var requestDetails: ReviewRequestOpRequestDetails
  public var action: ReviewRequestOpAction
  public var reason: Longstring
  public var reviewDetails: ReviewDetails
  public var ext: ReviewRequestOpExt

  public init(
      requestID: Uint64,
      requestHash: Hash,
      requestDetails: ReviewRequestOpRequestDetails,
      action: ReviewRequestOpAction,
      reason: Longstring,
      reviewDetails: ReviewDetails,
      ext: ReviewRequestOpExt) {

    self.requestID = requestID
    self.requestHash = requestHash
    self.requestDetails = requestDetails
    self.action = action
    self.reason = reason
    self.reviewDetails = reviewDetails
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.requestHash.toXDR())
    xdr.append(self.requestDetails.toXDR())
    xdr.append(self.action.toXDR())
    xdr.append(self.reason.toXDR())
    xdr.append(self.reviewDetails.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.requestID = try Uint64(xdrData: &xdrData)
    self.requestHash = try Hash(xdrData: &xdrData)
    self.requestDetails = try ReviewRequestOpRequestDetails(xdrData: &xdrData)
    self.action = try ReviewRequestOpAction(xdrData: &xdrData)
    self.reason = try Longstring(xdrData: &xdrData)
    self.reviewDetails = try ReviewDetails(xdrData: &xdrData)
    self.ext = try ReviewRequestOpExt(xdrData: &xdrData)
  }

  public enum ReviewRequestOpRequestDetails: XDRDiscriminatedUnion {
    case createWithdraw(WithdrawalDetails)
    case updateLimits(LimitsUpdateDetails)
    case createAmlAlert(AMLAlertDetails)
    case createInvoice(BillPayDetails)
    case manageContract(ContractDetails)

    public var discriminant: Int32 {
      switch self {
      case .createWithdraw: return ReviewableRequestType.createWithdraw.rawValue
      case .updateLimits: return ReviewableRequestType.updateLimits.rawValue
      case .createAmlAlert: return ReviewableRequestType.createAmlAlert.rawValue
      case .createInvoice: return ReviewableRequestType.createInvoice.rawValue
      case .manageContract: return ReviewableRequestType.manageContract.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .createWithdraw(let data): xdr.append(data.toXDR())
      case .updateLimits(let data): xdr.append(data.toXDR())
      case .createAmlAlert(let data): xdr.append(data.toXDR())
      case .createInvoice(let data): xdr.append(data.toXDR())
      case .manageContract(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case ReviewableRequestType.createWithdraw.rawValue:
        let data = try WithdrawalDetails(xdrData: &xdrData)
        self = .createWithdraw(data)
      case ReviewableRequestType.updateLimits.rawValue:
        let data = try LimitsUpdateDetails(xdrData: &xdrData)
        self = .updateLimits(data)
      case ReviewableRequestType.createAmlAlert.rawValue:
        let data = try AMLAlertDetails(xdrData: &xdrData)
        self = .createAmlAlert(data)
      case ReviewableRequestType.createInvoice.rawValue:
        let data = try BillPayDetails(xdrData: &xdrData)
        self = .createInvoice(data)
      case ReviewableRequestType.manageContract.rawValue:
        let data = try ContractDetails(xdrData: &xdrData)
        self = .manageContract(data)
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
  public enum ReviewRequestOpExt: XDRDiscriminatedUnion {
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
