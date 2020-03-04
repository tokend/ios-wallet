// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: `ManageLimitsResult` defines the result of ManageLimitsOp application based on given `ManageLimitsResultCode`
//  union ManageLimitsResult switch (ManageLimitsResultCode code)
//  {
//  case SUCCESS:
//      struct {
//          //: `details` represents an additional information of the `ManageLimitsOp` application result
//          union switch (ManageLimitsAction action)
//          {
//          case CREATE:
//              //: ID of the created limits entry
//              uint64 id;
//          case REMOVE:
//              void;
//          } details;
//  
//          //: reserved for future use
//          union switch (LedgerVersion v)
//          {
//          case EMPTY_VERSION:
//              void;
//          }
//          ext;
//  } success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum ManageLimitsResult: XDRDiscriminatedUnion {
  case success(ManageLimitsResultSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageLimitsResultCode.success.rawValue
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
    case ManageLimitsResultCode.success.rawValue:
      let data = try ManageLimitsResultSuccess(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
  public struct ManageLimitsResultSuccess: XDRCodable {
    public var details: ManageLimitsResultSuccessDetails
    public var ext: ManageLimitsResultSuccessExt

    public init(
        details: ManageLimitsResultSuccessDetails,
        ext: ManageLimitsResultSuccessExt) {

      self.details = details
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.details.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

    public init(xdrData: inout Data) throws {
      self.details = try ManageLimitsResultSuccessDetails(xdrData: &xdrData)
      self.ext = try ManageLimitsResultSuccessExt(xdrData: &xdrData)
    }

    public enum ManageLimitsResultSuccessDetails: XDRDiscriminatedUnion {
      case create(Uint64)
      case remove()

      public var discriminant: Int32 {
        switch self {
        case .create: return ManageLimitsAction.create.rawValue
        case .remove: return ManageLimitsAction.remove.rawValue
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
        case ManageLimitsAction.create.rawValue:
          let data = try Uint64(xdrData: &xdrData)
          self = .create(data)
        case ManageLimitsAction.remove.rawValue: self = .remove()
        default:
          throw XDRErrors.unknownEnumCase
        }
      }

    }
    public enum ManageLimitsResultSuccessExt: XDRDiscriminatedUnion {
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
