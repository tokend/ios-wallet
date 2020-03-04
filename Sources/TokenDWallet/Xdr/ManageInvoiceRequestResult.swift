// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union ManageInvoiceRequestResult switch (ManageInvoiceRequestResultCode code)
//  {
//  case SUCCESS:
//      struct
//      {
//          bool fulfilled;
//          union switch (ManageInvoiceRequestAction action)
//          {
//          case CREATE:
//              CreateInvoiceRequestResponse response;
//          case REMOVE:
//              void;
//          } details;
//  
//          // reserved for future use
//          union switch (LedgerVersion v)
//          {
//          case EMPTY_VERSION:
//              void;
//          } ext;
//      } success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum ManageInvoiceRequestResult: XDRDiscriminatedUnion {
  case success(ManageInvoiceRequestResultSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageInvoiceRequestResultCode.success.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .success(let data): xdr.append(data.toXDR())
    }

    return xdr
  }

  public init(xdrData: inout Data) throws {
    let discriminant = try Int32(xdrData: &xdrData)

    switch discriminant {
    case ManageInvoiceRequestResultCode.success.rawValue:
      let data = try ManageInvoiceRequestResultSuccess(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
  public struct ManageInvoiceRequestResultSuccess: XDRCodable {
    public var fulfilled: Bool
    public var details: ManageInvoiceRequestResultSuccessDetails
    public var ext: ManageInvoiceRequestResultSuccessExt

    public init(
        fulfilled: Bool,
        details: ManageInvoiceRequestResultSuccessDetails,
        ext: ManageInvoiceRequestResultSuccessExt) {

      self.fulfilled = fulfilled
      self.details = details
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.fulfilled.toXDR())
      xdr.append(self.details.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

    public init(xdrData: inout Data) throws {
      self.fulfilled = try Bool(xdrData: &xdrData)
      self.details = try ManageInvoiceRequestResultSuccessDetails(xdrData: &xdrData)
      self.ext = try ManageInvoiceRequestResultSuccessExt(xdrData: &xdrData)
    }

    public enum ManageInvoiceRequestResultSuccessDetails: XDRDiscriminatedUnion {
      case create(CreateInvoiceRequestResponse)
      case remove()

      public var discriminant: Int32 {
        switch self {
        case .create: return ManageInvoiceRequestAction.create.rawValue
        case .remove: return ManageInvoiceRequestAction.remove.rawValue
        }
      }

      public func toXDR() -> Data {
        var xdr = Data()

        xdr.append(self.discriminant.toXDR())

        switch self {
        case .create(let data): xdr.append(data.toXDR())
        case .remove(): xdr.append(Data())
        }

        return xdr
      }

      public init(xdrData: inout Data) throws {
        let discriminant = try Int32(xdrData: &xdrData)

        switch discriminant {
        case ManageInvoiceRequestAction.create.rawValue:
          let data = try CreateInvoiceRequestResponse(xdrData: &xdrData)
          self = .create(data)
        case ManageInvoiceRequestAction.remove.rawValue: self = .remove()
        default:
          throw XDRErrors.unknownEnumCase
        }
      }

    }
    public enum ManageInvoiceRequestResultSuccessExt: XDRDiscriminatedUnion {
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
}
