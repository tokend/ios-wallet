// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct TransactionResult
//  {
//      int64 feeCharged; // actual fee charged for the transaction
//  
//      union switch (TransactionResultCode code)
//      {
//      case txSUCCESS:
//      case txFAILED:
//          OperationResult results<>;
//      case txNO_ROLE_PERMISSION:
//          AccountRuleRequirement requirement;
//      default:
//          void;
//      }
//      result;
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
public struct TransactionResult: XDREncodable {
  public var feeCharged: Int64
  public var result: TransactionResultResult
  public var ext: TransactionResultExt

  public init(
      feeCharged: Int64,
      result: TransactionResultResult,
      ext: TransactionResultExt) {

    self.feeCharged = feeCharged
    self.result = result
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.feeCharged.toXDR())
    xdr.append(self.result.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum TransactionResultResult: XDRDiscriminatedUnion {
    case txsuccess([OperationResult])
    case txfailed([OperationResult])
    case txnoRolePermission(AccountRuleRequirement)

    public var discriminant: Int32 {
      switch self {
      case .txsuccess: return TransactionResultCode.txsuccess.rawValue
      case .txfailed: return TransactionResultCode.txfailed.rawValue
      case .txnoRolePermission: return TransactionResultCode.txnoRolePermission.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .txsuccess(let data): xdr.append(data.toXDR())
      case .txfailed(let data): xdr.append(data.toXDR())
      case .txnoRolePermission(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

  }
  public enum TransactionResultExt: XDRDiscriminatedUnion {
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
