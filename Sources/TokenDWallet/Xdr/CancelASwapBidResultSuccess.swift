// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct CancelASwapBidResultSuccess
//  {
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct CancelASwapBidResultSuccess: XDRCodable {
    
  public var ext: CancelASwapBidResultSuccessExt

  public init(
      ext: CancelASwapBidResultSuccessExt) {

    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.ext.toXDR())

    return xdr
  }
  
  public init(xdrData: inout Data) throws {
    self.ext = try CancelASwapBidResultSuccessExt(xdrData: &xdrData)
  }
  
  public enum CancelASwapBidResultSuccessExt: XDRDiscriminatedUnion {
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
