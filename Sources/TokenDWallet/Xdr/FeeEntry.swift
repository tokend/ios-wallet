// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: `FeeEntry` is used in the system configuration to set fees for different assets, operations (according to FeeType), particular account roles, particular accounts,
//  //: or globally (only if both parameters particular account role and paticular account are not specified).
//  struct FeeEntry
//  {
//      //: Type of a particular fee depending on the operation (e.g., PAYMENT_FEE for payment operation, WITHDRAWAL_FEE for withdrawal operation, etc.)
//      FeeType feeType;
//      //: Code of an asset used in the operation for which the fee will be charged
//      AssetCode asset;
//  
//      //: Fixed amount of fee that will be charged for the operation
//      int64 fixedFee;
//      //: Percent from the operation amount that will be charged for the corresponding operation
//      int64 percentFee;
//  
//      //: (optional) Account for which a fee is set in the system
//      AccountID* accountID;
//      //: (optional) Account for which a fee is set in the system
//      uint64*    accountRole;
//      //: Defines a `subtype` of a fee if such exists (e.g., `OUTGOING` or `INCOMING` for `PAYMENT_FEE`)
//      int64 subtype;
//  
//      //: Defines the lower bound of operation amount for which this fee is applicable
//      int64 lowerBound;
//      //: Defines the upper bound of operation amount for which this fee is applicable
//      int64 upperBound;
//  
//      //: Hash of `type:<feeType>asset:<asset>subtype:<subtype>`
//      //: (Add `accountID:<accountID>` or `accountRole:<accountRole>` if corresponding fields are defined)
//      Hash hash;
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
public struct FeeEntry: XDRCodable {
  public var feeType: FeeType
  public var asset: AssetCode
  public var fixedFee: Int64
  public var percentFee: Int64
  public var accountID: AccountID?
  public var accountRole: Uint64?
  public var subtype: Int64
  public var lowerBound: Int64
  public var upperBound: Int64
  public var hash: Hash
  public var ext: FeeEntryExt

  public init(
      feeType: FeeType,
      asset: AssetCode,
      fixedFee: Int64,
      percentFee: Int64,
      accountID: AccountID?,
      accountRole: Uint64?,
      subtype: Int64,
      lowerBound: Int64,
      upperBound: Int64,
      hash: Hash,
      ext: FeeEntryExt) {

    self.feeType = feeType
    self.asset = asset
    self.fixedFee = fixedFee
    self.percentFee = percentFee
    self.accountID = accountID
    self.accountRole = accountRole
    self.subtype = subtype
    self.lowerBound = lowerBound
    self.upperBound = upperBound
    self.hash = hash
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.feeType.toXDR())
    xdr.append(self.asset.toXDR())
    xdr.append(self.fixedFee.toXDR())
    xdr.append(self.percentFee.toXDR())
    xdr.append(self.accountID.toXDR())
    xdr.append(self.accountRole.toXDR())
    xdr.append(self.subtype.toXDR())
    xdr.append(self.lowerBound.toXDR())
    xdr.append(self.upperBound.toXDR())
    xdr.append(self.hash.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.feeType = try FeeType(xdrData: &xdrData)
    self.asset = try AssetCode(xdrData: &xdrData)
    self.fixedFee = try Int64(xdrData: &xdrData)
    self.percentFee = try Int64(xdrData: &xdrData)
    if (try Bool(xdrData: &xdrData)) {
      self.accountID = try AccountID(xdrData: &xdrData)
    } else {
      self.accountID = nil
    }
    if (try Bool(xdrData: &xdrData)) {
      self.accountRole = try Uint64(xdrData: &xdrData)
    } else {
      self.accountRole = nil
    }
    self.subtype = try Int64(xdrData: &xdrData)
    self.lowerBound = try Int64(xdrData: &xdrData)
    self.upperBound = try Int64(xdrData: &xdrData)
    self.hash = try Hash(xdrData: &xdrData)
    self.ext = try FeeEntryExt(xdrData: &xdrData)
  }

  public enum FeeEntryExt: XDRDiscriminatedUnion {
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
