// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct InvoiceRequest
//  {
//      AssetCode asset;
//      uint64 amount; // not allowed to set 0
//      BalanceID senderBalance;
//      BalanceID receiverBalance;
//  
//      uint64 *contractID;
//      bool isApproved;
//      longstring creatorDetails; // details set by requester
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
public struct InvoiceRequest: XDREncodable {
  public var asset: AssetCode
  public var amount: Uint64
  public var senderBalance: BalanceID
  public var receiverBalance: BalanceID
  public var contractID: Uint64?
  public var isApproved: Bool
  public var creatorDetails: Longstring
  public var ext: InvoiceRequestExt

  public init(
      asset: AssetCode,
      amount: Uint64,
      senderBalance: BalanceID,
      receiverBalance: BalanceID,
      contractID: Uint64?,
      isApproved: Bool,
      creatorDetails: Longstring,
      ext: InvoiceRequestExt) {

    self.asset = asset
    self.amount = amount
    self.senderBalance = senderBalance
    self.receiverBalance = receiverBalance
    self.contractID = contractID
    self.isApproved = isApproved
    self.creatorDetails = creatorDetails
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.asset.toXDR())
    xdr.append(self.amount.toXDR())
    xdr.append(self.senderBalance.toXDR())
    xdr.append(self.receiverBalance.toXDR())
    xdr.append(self.contractID.toXDR())
    xdr.append(self.isApproved.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum InvoiceRequestExt: XDRDiscriminatedUnion {
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