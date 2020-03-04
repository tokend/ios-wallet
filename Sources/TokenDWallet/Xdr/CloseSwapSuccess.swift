// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CloseSwapSuccess is used to pass saved ledger hash and license hash
//  struct CloseSwapSuccess {
//      //: Effect of CloseSwap application
//      CloseSwapEffect effect;
//  
//      EmptyExt ext;
//  };

//  ===========================================================================
public struct CloseSwapSuccess: XDRCodable {
  public var effect: CloseSwapEffect
  public var ext: EmptyExt

  public init(
      effect: CloseSwapEffect,
      ext: EmptyExt) {

    self.effect = effect
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.effect.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.effect = try CloseSwapEffect(xdrData: &xdrData)
    self.ext = try EmptyExt(xdrData: &xdrData)
  }
}