// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct CreateWithdrawalRequestOp
//  {
//      //: Withdrawal request to create 
//      WithdrawalRequest request;
//      //: (optional) Bit mask whose flags must be cleared in order for WithdrawalRequest to be approved, which will be used  
//      //: instead of key-value by key withdrawal_tasks:<asset_code> 
//      uint32* allTasks;
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  
//  };

//  ===========================================================================
public struct CreateWithdrawalRequestOp: XDREncodable {
  public var request: WithdrawalRequest
  public var allTasks: Uint32?
  public var ext: CreateWithdrawalRequestOpExt

  public init(
      request: WithdrawalRequest,
      allTasks: Uint32?,
      ext: CreateWithdrawalRequestOpExt) {

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

  public enum CreateWithdrawalRequestOpExt: XDRDiscriminatedUnion {
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
