// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct Limits
//  {
//      int64 dailyOut;
//      int64 weeklyOut;
//      int64 monthlyOut;
//      int64 annualOut;
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
public struct Limits: XDREncodable {
  public var dailyOut: Int64
  public var weeklyOut: Int64
  public var monthlyOut: Int64
  public var annualOut: Int64
  public var ext: LimitsExt

  public init(
      dailyOut: Int64,
      weeklyOut: Int64,
      monthlyOut: Int64,
      annualOut: Int64,
      ext: LimitsExt) {

    self.dailyOut = dailyOut
    self.weeklyOut = weeklyOut
    self.monthlyOut = monthlyOut
    self.annualOut = annualOut
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.dailyOut.toXDR())
    xdr.append(self.weeklyOut.toXDR())
    xdr.append(self.monthlyOut.toXDR())
    xdr.append(self.annualOut.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum LimitsExt: XDRDiscriminatedUnion {
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