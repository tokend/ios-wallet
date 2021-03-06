// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: `Fee` is used to unite fixed and percent fee amounts
//  struct Fee {
//      //: Fixed amount to pay for the operation
//  	uint64 fixed;
//  	//: Part of the managed amount in percents
//  	uint64 percent;
//  
//      //: reserved for future use
//      union switch(LedgerVersion v)
//      {
//          case EMPTY_VERSION:
//              void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct Fee: XDRCodable {
  public var fixed: Uint64
  public var percent: Uint64
  public var ext: FeeExt

  public init(
      fixed: Uint64,
      percent: Uint64,
      ext: FeeExt) {

    self.fixed = fixed
    self.percent = percent
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.fixed.toXDR())
    xdr.append(self.percent.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.fixed = try Uint64(xdrData: &xdrData)
    self.percent = try Uint64(xdrData: &xdrData)
    self.ext = try FeeExt(xdrData: &xdrData)
  }

  public enum FeeExt: XDRDiscriminatedUnion {
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
