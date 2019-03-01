// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct UpdateMaxIssuance
//  {
//      //: `assetCode` defines an asset entry which would be updated
//      AssetCode assetCode;
//      //: new max issuance amount for asset entry
//      uint64 maxIssuanceAmount;
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
public struct UpdateMaxIssuance: XDREncodable {
  public var assetCode: AssetCode
  public var maxIssuanceAmount: Uint64
  public var ext: UpdateMaxIssuanceExt

  public init(
      assetCode: AssetCode,
      maxIssuanceAmount: Uint64,
      ext: UpdateMaxIssuanceExt) {

    self.assetCode = assetCode
    self.maxIssuanceAmount = maxIssuanceAmount
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.assetCode.toXDR())
    xdr.append(self.maxIssuanceAmount.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum UpdateMaxIssuanceExt: XDRDiscriminatedUnion {
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
