// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct ContractRequest
//  {
//      AccountID customer;
//      AccountID escrow;
//      longstring creatorDetails; // details set by requester
//  
//      uint64 startTime;
//      uint64 endTime;
//  
//      // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct ContractRequest: XDRCodable {
  public var customer: AccountID
  public var escrow: AccountID
  public var creatorDetails: Longstring
  public var startTime: Uint64
  public var endTime: Uint64
  public var ext: ContractRequestExt

  public init(
      customer: AccountID,
      escrow: AccountID,
      creatorDetails: Longstring,
      startTime: Uint64,
      endTime: Uint64,
      ext: ContractRequestExt) {

    self.customer = customer
    self.escrow = escrow
    self.creatorDetails = creatorDetails
    self.startTime = startTime
    self.endTime = endTime
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.customer.toXDR())
    xdr.append(self.escrow.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.startTime.toXDR())
    xdr.append(self.endTime.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.customer = try AccountID(xdrData: &xdrData)
    self.escrow = try AccountID(xdrData: &xdrData)
    self.creatorDetails = try Longstring(xdrData: &xdrData)
    self.startTime = try Uint64(xdrData: &xdrData)
    self.endTime = try Uint64(xdrData: &xdrData)
    self.ext = try ContractRequestExt(xdrData: &xdrData)
  }

  public enum ContractRequestExt: XDRDiscriminatedUnion {
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
