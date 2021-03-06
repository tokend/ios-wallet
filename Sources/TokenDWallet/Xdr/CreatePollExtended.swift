// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Extended result of the review request operation containing details specific to a `CREATE_POLL` request
//  struct CreatePollExtended
//  {
//      //: ID of the newly created poll
//      uint64 pollID;
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
public struct CreatePollExtended: XDRCodable {
  public var pollID: Uint64
  public var ext: CreatePollExtendedExt

  public init(
      pollID: Uint64,
      ext: CreatePollExtendedExt) {

    self.pollID = pollID
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.pollID.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.pollID = try Uint64(xdrData: &xdrData)
    self.ext = try CreatePollExtendedExt(xdrData: &xdrData)
  }

  public enum CreatePollExtendedExt: XDRDiscriminatedUnion {
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
