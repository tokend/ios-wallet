// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Details regarding the `Update Sale Details` request
//  struct UpdateSaleDetailsData {
//      //: ID of a reviewable request. If set 0, request is created, else - request is updated
//      uint64 requestID; // if requestID is 0 - create request, else - update
//      //: Arbitrary stringified json object that can be used to attach data to be reviewed by an admin
//      longstring creatorDetails;
//      //: (optional) Bit mask whose flags must be cleared in order for UpdateSaleDetailsRequest to be approved,
//      //: which will be used instead of key-value by key sale_update_tasks:<asset_code>
//      uint32* allTasks;
//  
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct UpdateSaleDetailsData: XDRCodable {
  public var requestID: Uint64
  public var creatorDetails: Longstring
  public var allTasks: Uint32?
  public var ext: UpdateSaleDetailsDataExt

  public init(
      requestID: Uint64,
      creatorDetails: Longstring,
      allTasks: Uint32?,
      ext: UpdateSaleDetailsDataExt) {

    self.requestID = requestID
    self.creatorDetails = creatorDetails
    self.allTasks = allTasks
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.allTasks.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.requestID = try Uint64(xdrData: &xdrData)
    self.creatorDetails = try Longstring(xdrData: &xdrData)
    if (try Bool(xdrData: &xdrData)) {
      self.allTasks = try Uint32(xdrData: &xdrData)
    } else {
      self.allTasks = nil
    }
    self.ext = try UpdateSaleDetailsDataExt(xdrData: &xdrData)
  }

  public enum UpdateSaleDetailsDataExt: XDRDiscriminatedUnion {
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
