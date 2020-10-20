// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Success result of operation application
//  struct ManageCreatePollRequestSuccessResult
//  {
//      //: `details` id used to pass useful fields
//      union switch (ManageCreatePollRequestAction action)
//      {
//      case CREATE:
//          CreatePollRequestResponse response;
//      case CANCEL:
//          void;
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
public struct ManageCreatePollRequestSuccessResult: XDRCodable {
  public var details: ManageCreatePollRequestSuccessResultDetails
  public var ext: ManageCreatePollRequestSuccessResultExt

  public init(
      details: ManageCreatePollRequestSuccessResultDetails,
      ext: ManageCreatePollRequestSuccessResultExt) {

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
    self.details = try ManageCreatePollRequestSuccessResultDetails(xdrData: &xdrData)
    self.ext = try ManageCreatePollRequestSuccessResultExt(xdrData: &xdrData)
  }

  public enum ManageCreatePollRequestSuccessResultDetails: XDRDiscriminatedUnion {
    case create(CreatePollRequestResponse)
    case cancel

    public var discriminant: Int32 {
      switch self {
      case .create: return ManageCreatePollRequestAction.create.rawValue
      case .cancel: return ManageCreatePollRequestAction.cancel.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .create(let data): xdr.append(data.toXDR())
      case .cancel: xdr.append(Data())
      }

      return xdr
    }

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case ManageCreatePollRequestAction.create.rawValue:
        let data = try CreatePollRequestResponse(xdrData: &xdrData)
        self = .create(data)
      case ManageCreatePollRequestAction.cancel.rawValue: self = .cancel
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
  public enum ManageCreatePollRequestSuccessResultExt: XDRDiscriminatedUnion {
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
