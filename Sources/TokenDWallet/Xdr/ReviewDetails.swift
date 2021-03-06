// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Details of a request review
//  struct ReviewDetails {
//      //: Tasks to add to pending
//      uint32 tasksToAdd;
//      //: Tasks to remove from pending
//      uint32 tasksToRemove;
//      //: Details of the current review
//      string externalDetails<>;
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct ReviewDetails: XDRCodable {
  public var tasksToAdd: Uint32
  public var tasksToRemove: Uint32
  public var externalDetails: String
  public var ext: ReviewDetailsExt

  public init(
      tasksToAdd: Uint32,
      tasksToRemove: Uint32,
      externalDetails: String,
      ext: ReviewDetailsExt) {

    self.tasksToAdd = tasksToAdd
    self.tasksToRemove = tasksToRemove
    self.externalDetails = externalDetails
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.tasksToAdd.toXDR())
    xdr.append(self.tasksToRemove.toXDR())
    xdr.append(self.externalDetails.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.tasksToAdd = try Uint32(xdrData: &xdrData)
    self.tasksToRemove = try Uint32(xdrData: &xdrData)
    self.externalDetails = try String(xdrData: &xdrData)
    self.ext = try ReviewDetailsExt(xdrData: &xdrData)
  }

  public enum ReviewDetailsExt: XDRDiscriminatedUnion {
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
