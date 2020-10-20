// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct CreateDataRemoveRequestSuccess {
//      uint64 requestID;
//      bool fulfilled;
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
public struct CreateDataRemoveRequestSuccess: XDRCodable {
  public var requestID: Uint64
  public var fulfilled: Bool
  public var ext: CreateDataRemoveRequestSuccessExt

  public init(
      requestID: Uint64,
      fulfilled: Bool,
      ext: CreateDataRemoveRequestSuccessExt) {

    self.requestID = requestID
    self.fulfilled = fulfilled
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.fulfilled.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.requestID = try Uint64(xdrData: &xdrData)
    self.fulfilled = try Bool(xdrData: &xdrData)
    self.ext = try CreateDataRemoveRequestSuccessExt(xdrData: &xdrData)
  }

  public enum CreateDataRemoveRequestSuccessExt: XDRDiscriminatedUnion {
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
