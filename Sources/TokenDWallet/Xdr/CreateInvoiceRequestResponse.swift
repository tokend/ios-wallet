// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct CreateInvoiceRequestResponse
//  {
//  	BalanceID receiverBalance;
//  	BalanceID senderBalance;
//  
//  	uint64 requestID;
//  
//  	union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct CreateInvoiceRequestResponse: XDRCodable {
  public var receiverBalance: BalanceID
  public var senderBalance: BalanceID
  public var requestID: Uint64
  public var ext: CreateInvoiceRequestResponseExt

  public init(
      receiverBalance: BalanceID,
      senderBalance: BalanceID,
      requestID: Uint64,
      ext: CreateInvoiceRequestResponseExt) {

    self.receiverBalance = receiverBalance
    self.senderBalance = senderBalance
    self.requestID = requestID
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.receiverBalance.toXDR())
    xdr.append(self.senderBalance.toXDR())
    xdr.append(self.requestID.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.receiverBalance = try BalanceID(xdrData: &xdrData)
    self.senderBalance = try BalanceID(xdrData: &xdrData)
    self.requestID = try Uint64(xdrData: &xdrData)
    self.ext = try CreateInvoiceRequestResponseExt(xdrData: &xdrData)
  }

  public enum CreateInvoiceRequestResponseExt: XDRDiscriminatedUnion {
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
