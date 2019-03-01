// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct ManageContractRequestOp
//  {
//      union switch (ManageContractRequestAction action){
//      case CREATE:
//          CreateContractRequest createContractRequest;
//      case REMOVE:
//          uint64 requestID;
//      } details;
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
public struct ManageContractRequestOp: XDREncodable {
  public var details: ManageContractRequestOpDetails
  public var ext: ManageContractRequestOpExt

  public init(
      details: ManageContractRequestOpDetails,
      ext: ManageContractRequestOpExt) {

    self.details = details
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.details.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum ManageContractRequestOpDetails: XDRDiscriminatedUnion {
    case create(CreateContractRequest)
    case remove(Uint64)

    public var discriminant: Int32 {
      switch self {
      case .create: return ManageContractRequestAction.create.rawValue
      case .remove: return ManageContractRequestAction.remove.rawValue
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
  public enum ManageContractRequestOpExt: XDRDiscriminatedUnion {
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
