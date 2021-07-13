// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct CreateDataCreationRequestSuccess {
//      uint64 requestID;
//      bool fulfilled;
//      AccountID owner;
//      uint64 id;
//      uint64 type;
//      longstring value;
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
public struct CreateDataCreationRequestSuccess: XDRCodable {
  public var requestID: Uint64
  public var fulfilled: Bool
  public var owner: AccountID
  public var id: Uint64
  public var type: Uint64
  public var value: Longstring
  public var ext: CreateDataCreationRequestSuccessExt

  public init(
      requestID: Uint64,
      fulfilled: Bool,
      owner: AccountID,
      id: Uint64,
      type: Uint64,
      value: Longstring,
      ext: CreateDataCreationRequestSuccessExt) {

    self.requestID = requestID
    self.fulfilled = fulfilled
    self.owner = owner
    self.id = id
    self.type = type
    self.value = value
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.fulfilled.toXDR())
    xdr.append(self.owner.toXDR())
    xdr.append(self.id.toXDR())
    xdr.append(self.type.toXDR())
    xdr.append(self.value.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.requestID = try Uint64(xdrData: &xdrData)
    self.fulfilled = try Bool(xdrData: &xdrData)
    self.owner = try AccountID(xdrData: &xdrData)
    self.id = try Uint64(xdrData: &xdrData)
    self.type = try Uint64(xdrData: &xdrData)
    self.value = try Longstring(xdrData: &xdrData)
    self.ext = try CreateDataCreationRequestSuccessExt(xdrData: &xdrData)
  }

  public enum CreateDataCreationRequestSuccessExt: XDRDiscriminatedUnion {
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