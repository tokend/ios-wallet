// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //:Result of successful application of CreateIssuanceRequest operation
//  struct CreateIssuanceRequestSuccess {
//      //: ID of a newly created issuance request
//      uint64 requestID;
//      //: Account address of the receiver
//      AccountID receiver;
//      //: Indicates whether or not the Issuance request was auto approved and fulfilled
//      bool fulfilled;
//      //: Paid fee
//      Fee fee;
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct CreateIssuanceRequestSuccess: XDRCodable {
  public var requestID: Uint64
  public var receiver: AccountID
  public var fulfilled: Bool
  public var fee: Fee
  public var ext: CreateIssuanceRequestSuccessExt

  public init(
      requestID: Uint64,
      receiver: AccountID,
      fulfilled: Bool,
      fee: Fee,
      ext: CreateIssuanceRequestSuccessExt) {

    self.requestID = requestID
    self.receiver = receiver
    self.fulfilled = fulfilled
    self.fee = fee
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.receiver.toXDR())
    xdr.append(self.fulfilled.toXDR())
    xdr.append(self.fee.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.requestID = try Uint64(xdrData: &xdrData)
    self.receiver = try AccountID(xdrData: &xdrData)
    self.fulfilled = try Bool(xdrData: &xdrData)
    self.fee = try Fee(xdrData: &xdrData)
    self.ext = try CreateIssuanceRequestSuccessExt(xdrData: &xdrData)
  }

  public enum CreateIssuanceRequestSuccessExt: XDRDiscriminatedUnion {
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
