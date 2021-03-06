// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct ManageContractOp
//  {
//      uint64 contractID;
//  
//      union switch (ManageContractAction action)
//      {
//      case ADD_DETAILS:
//          longstring details;
//      case CONFIRM_COMPLETED:
//          void;
//      case START_DISPUTE:
//          longstring disputeReason;
//      case RESOLVE_DISPUTE:
//          bool isRevert;
//      }
//      data;
//  
//  	// reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct ManageContractOp: XDRCodable {
  public var contractID: Uint64
  public var data: ManageContractOpData
  public var ext: ManageContractOpExt

  public init(
      contractID: Uint64,
      data: ManageContractOpData,
      ext: ManageContractOpExt) {

    self.contractID = contractID
    self.data = data
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.contractID.toXDR())
    xdr.append(self.data.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.contractID = try Uint64(xdrData: &xdrData)
    self.data = try ManageContractOpData(xdrData: &xdrData)
    self.ext = try ManageContractOpExt(xdrData: &xdrData)
  }

  public enum ManageContractOpData: XDRDiscriminatedUnion {
    case addDetails(Longstring)
    case confirmCompleted
    case startDispute(Longstring)
    case resolveDispute(Bool)

    public var discriminant: Int32 {
      switch self {
      case .addDetails: return ManageContractAction.addDetails.rawValue
      case .confirmCompleted: return ManageContractAction.confirmCompleted.rawValue
      case .startDispute: return ManageContractAction.startDispute.rawValue
      case .resolveDispute: return ManageContractAction.resolveDispute.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .addDetails(let data): xdr.append(data.toXDR())
      case .confirmCompleted: xdr.append(Data())
      case .startDispute(let data): xdr.append(data.toXDR())
      case .resolveDispute(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case ManageContractAction.addDetails.rawValue:
        let data = try Longstring(xdrData: &xdrData)
        self = .addDetails(data)
      case ManageContractAction.confirmCompleted.rawValue: self = .confirmCompleted
      case ManageContractAction.startDispute.rawValue:
        let data = try Longstring(xdrData: &xdrData)
        self = .startDispute(data)
      case ManageContractAction.resolveDispute.rawValue:
        let data = try Bool(xdrData: &xdrData)
        self = .resolveDispute(data)
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
  public enum ManageContractOpExt: XDRDiscriminatedUnion {
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
