// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct SCPEnvelope
//  {
//      SCPStatement statement;
//      Signature signature;
//  };

//  ===========================================================================
public struct SCPEnvelope: XDRCodable {
  public var statement: SCPStatement
  public var signature: Signature

  public init(
      statement: SCPStatement,
      signature: Signature) {

    self.statement = statement
    self.signature = signature
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.statement.toXDR())
    xdr.append(self.signature.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.statement = try SCPStatement(xdrData: &xdrData)
    self.signature = try Signature(xdrData: &xdrData)
  }
}
