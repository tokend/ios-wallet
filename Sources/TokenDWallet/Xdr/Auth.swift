// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct Auth
//  {
//      // Empty message, just to confirm
//      // establishment of MAC keys.
//      int unused;
//  };

//  ===========================================================================
public struct Auth: XDRCodable {
  public var unused: Int32

  public init(
      unused: Int32) {

    self.unused = unused
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.unused.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.unused = try Int32(xdrData: &xdrData)
  }
}
