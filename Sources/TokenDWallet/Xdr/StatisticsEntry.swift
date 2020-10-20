// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct StatisticsEntry
//  {
//  	AccountID accountID;
//  
//  	uint64 dailyOutcome;
//  	uint64 weeklyOutcome;
//  	uint64 monthlyOutcome;
//  	uint64 annualOutcome;
//  
//  	int64 updatedAt;
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
public struct StatisticsEntry: XDRCodable {
  public var accountID: AccountID
  public var dailyOutcome: Uint64
  public var weeklyOutcome: Uint64
  public var monthlyOutcome: Uint64
  public var annualOutcome: Uint64
  public var updatedAt: Int64
  public var ext: StatisticsEntryExt

  public init(
      accountID: AccountID,
      dailyOutcome: Uint64,
      weeklyOutcome: Uint64,
      monthlyOutcome: Uint64,
      annualOutcome: Uint64,
      updatedAt: Int64,
      ext: StatisticsEntryExt) {

    self.accountID = accountID
    self.dailyOutcome = dailyOutcome
    self.weeklyOutcome = weeklyOutcome
    self.monthlyOutcome = monthlyOutcome
    self.annualOutcome = annualOutcome
    self.updatedAt = updatedAt
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.accountID.toXDR())
    xdr.append(self.dailyOutcome.toXDR())
    xdr.append(self.weeklyOutcome.toXDR())
    xdr.append(self.monthlyOutcome.toXDR())
    xdr.append(self.annualOutcome.toXDR())
    xdr.append(self.updatedAt.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.accountID = try AccountID(xdrData: &xdrData)
    self.dailyOutcome = try Uint64(xdrData: &xdrData)
    self.weeklyOutcome = try Uint64(xdrData: &xdrData)
    self.monthlyOutcome = try Uint64(xdrData: &xdrData)
    self.annualOutcome = try Uint64(xdrData: &xdrData)
    self.updatedAt = try Int64(xdrData: &xdrData)
    self.ext = try StatisticsEntryExt(xdrData: &xdrData)
  }

  public enum StatisticsEntryExt: XDRDiscriminatedUnion {
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
