// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CreateAtomicSwapAskRequestOp is used to create `CREATE_ATOMIC_SWAP_ASK` request
//  struct CreateAtomicSwapAskRequestOp
//  {
//      //: Body of request which will be created
//      CreateAtomicSwapAskRequest request;
//  
//      //: (optional) Bit mask whose flags must be cleared in order for `CREATE_ATOMIC_SWAP_BID` request to be approved,
//      //: which will be used instead of key-value by `atomic_swap_bid_tasks` key
//      uint32* allTasks;
//      //: reserved for the future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct CreateAtomicSwapAskRequestOp: XDRCodable {
  public var request: CreateAtomicSwapAskRequest
  public var allTasks: Uint32?
  public var ext: CreateAtomicSwapAskRequestOpExt

  public init(
      request: CreateAtomicSwapAskRequest,
      allTasks: Uint32?,
      ext: CreateAtomicSwapAskRequestOpExt) {

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

  public init(xdrData: inout Data) throws {
    self.request = try CreateAtomicSwapAskRequest(xdrData: &xdrData)
    if (try Bool(xdrData: &xdrData)) {
      self.allTasks = try Uint32(xdrData: &xdrData)
    } else {
      self.allTasks = nil
    }
    self.ext = try CreateAtomicSwapAskRequestOpExt(xdrData: &xdrData)
  }

  public enum CreateAtomicSwapAskRequestOpExt: XDRDiscriminatedUnion {
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
