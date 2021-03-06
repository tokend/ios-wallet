// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct DecoratedSignature
//  {
//      SignatureHint hint;  // last 4 bytes of the public key, used as a hint
//      Signature signature; // actual signature
//  };

//  ===========================================================================
public struct DecoratedSignature: XDRCodable {
  public var hint: SignatureHint
  public var signature: Signature

  public init(
      hint: SignatureHint,
      signature: Signature) {

    self.hint = hint
    self.signature = signature
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.hint.toXDR())
    xdr.append(self.signature.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.hint = try SignatureHint(xdrData: &xdrData)
    self.signature = try Signature(xdrData: &xdrData)
  }
}
