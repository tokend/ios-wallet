// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct ChangeRoleRequest
//  {
//  	AccountID destinationAccount;
//  	uint64 accountRoleToSet;
//  
//  	// Sequence number increases when request is rejected
//  	uint32 sequenceNumber;
//  
//      longstring creatorDetails; // details set by requester
//  
//      // Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct ChangeRoleRequest: XDRCodable {
  public var destinationAccount: AccountID
  public var accountRoleToSet: Uint64
  public var sequenceNumber: Uint32
  public var creatorDetails: Longstring
  public var ext: ChangeRoleRequestExt

  public init(
      destinationAccount: AccountID,
      accountRoleToSet: Uint64,
      sequenceNumber: Uint32,
      creatorDetails: Longstring,
      ext: ChangeRoleRequestExt) {

    self.destinationAccount = destinationAccount
    self.accountRoleToSet = accountRoleToSet
    self.sequenceNumber = sequenceNumber
    self.creatorDetails = creatorDetails
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.destinationAccount.toXDR())
    xdr.append(self.accountRoleToSet.toXDR())
    xdr.append(self.sequenceNumber.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.destinationAccount = try AccountID(xdrData: &xdrData)
    self.accountRoleToSet = try Uint64(xdrData: &xdrData)
    self.sequenceNumber = try Uint32(xdrData: &xdrData)
    self.creatorDetails = try Longstring(xdrData: &xdrData)
    self.ext = try ChangeRoleRequestExt(xdrData: &xdrData)
  }

  public enum ChangeRoleRequestExt: XDRDiscriminatedUnion {
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
