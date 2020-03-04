// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of the successful application of CreateSaleCreationRequest operation
//  struct CreateSaleCreationSuccess {
//      //: ID of the SaleCreation request
//      uint64 requestID;
//      //: ID of a newly created sale (if the sale creation request has been auto approved)
//      uint64 saleID;
//      //: Indicates whether or not the sale creation request was auto approved and fulfilled
//      bool fulfilled;
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct CreateSaleCreationSuccess: XDRCodable {
  public var requestID: Uint64
  public var saleID: Uint64
  public var fulfilled: Bool
  public var ext: CreateSaleCreationSuccessExt

  public init(
      requestID: Uint64,
      saleID: Uint64,
      fulfilled: Bool,
      ext: CreateSaleCreationSuccessExt) {

    self.requestID = requestID
    self.saleID = saleID
    self.fulfilled = fulfilled
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.saleID.toXDR())
    xdr.append(self.fulfilled.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.requestID = try Uint64(xdrData: &xdrData)
    self.saleID = try Uint64(xdrData: &xdrData)
    self.fulfilled = try Bool(xdrData: &xdrData)
    self.ext = try CreateSaleCreationSuccessExt(xdrData: &xdrData)
  }

  public enum CreateSaleCreationSuccessExt: XDRDiscriminatedUnion {
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
