// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct CreatePreIssuanceRequestOp
//  {
//      //: Body of PreIssuanceRequest to be created
//      PreIssuanceRequest request;
//  
//      //: (optional) Bit mask whose flags must be cleared in order for PreIssuanceRequest to be approved, which will be used
//      //: instead of key-value by key `preissuance_tasks`
//      uint32* allTasks;
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct CreatePreIssuanceRequestOp: XDREncodable {
  public var request: PreIssuanceRequest
  public var allTasks: Uint32?
  public var ext: CreatePreIssuanceRequestOpExt

  public init(
      request: PreIssuanceRequest,
      allTasks: Uint32?,
      ext: CreatePreIssuanceRequestOpExt) {

    self.request = request
    self.allTasks = allTasks
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.request.toXDR())
    xdr.append(self.allTasks.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum CreatePreIssuanceRequestOpExt: XDRDiscriminatedUnion {
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
