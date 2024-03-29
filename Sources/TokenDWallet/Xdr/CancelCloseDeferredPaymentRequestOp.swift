// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CancelCloseDeferredPaymentRequestOp is used to cancel existing deferred payment creation request
//  struct CancelCloseDeferredPaymentRequestOp
//  {
//      //: id of existing request
//      uint64 requestID;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct CancelCloseDeferredPaymentRequestOp: XDRCodable {
  public var requestID: Uint64
  public var ext: CancelCloseDeferredPaymentRequestOpExt

  public init(
      requestID: Uint64,
      ext: CancelCloseDeferredPaymentRequestOpExt) {

    self.requestID = requestID
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.requestID = try Uint64(xdrData: &xdrData)
    self.ext = try CancelCloseDeferredPaymentRequestOpExt(xdrData: &xdrData)
  }

  public enum CancelCloseDeferredPaymentRequestOpExt: XDRDiscriminatedUnion {
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
