// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct ManageLimitsOp
//  {
//      //: `details` defines all details of the operation based on the given `ManageLimitsAction`
//      union switch (ManageLimitsAction action)
//      {
//      case CREATE:
//          LimitsCreateDetails limitsCreateDetails;
//      case REMOVE:
//          uint64 id;
//      } details;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct ManageLimitsOp: XDREncodable {
  public var details: ManageLimitsOpDetails
  public var ext: ManageLimitsOpExt

  public init(
      details: ManageLimitsOpDetails,
      ext: ManageLimitsOpExt) {

    self.details = details
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.details.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum ManageLimitsOpDetails: XDRDiscriminatedUnion {
    case create(LimitsCreateDetails)
    case remove(Uint64)

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
      case .remove(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

  }
  public enum ManageLimitsOpExt: XDRDiscriminatedUnion {
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