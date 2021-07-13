// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct DataCreationRequest {
//      //: Numeric type, used for access control
//      uint64 type;
//  
//      // Sequence number increases when request is rejected
//  	uint32 sequenceNumber;
//  
//      //: Owner of data to create
//      AccountID owner;
//  
//      //: Value stored
//      longstring value;
//  
//      //: Arbitrary stringified json object that can be used to attach data to be reviewed by an admin
//      longstring creatorDetails; // details set by requester
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
public struct DataCreationRequest: XDRCodable {
  public var type: Uint64
  public var sequenceNumber: Uint32
  public var owner: AccountID
  public var value: Longstring
  public var creatorDetails: Longstring
  public var ext: DataCreationRequestExt

  public init(
      type: Uint64,
      sequenceNumber: Uint32,
      owner: AccountID,
      value: Longstring,
      creatorDetails: Longstring,
      ext: DataCreationRequestExt) {

    self.type = type
    self.sequenceNumber = sequenceNumber
    self.owner = owner
    self.value = value
    self.creatorDetails = creatorDetails
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.type.toXDR())
    xdr.append(self.sequenceNumber.toXDR())
    xdr.append(self.owner.toXDR())
    xdr.append(self.value.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.type = try Uint64(xdrData: &xdrData)
    self.sequenceNumber = try Uint32(xdrData: &xdrData)
    self.owner = try AccountID(xdrData: &xdrData)
    self.value = try Longstring(xdrData: &xdrData)
    self.creatorDetails = try Longstring(xdrData: &xdrData)
    self.ext = try DataCreationRequestExt(xdrData: &xdrData)
  }

  public enum DataCreationRequestExt: XDRDiscriminatedUnion {
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