// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct CreatePaymentRequestOp
//  {
//      //: Payment request details
//      CreatePaymentRequest request;
//  
//      //: (optional) Bit mask whose flags must be cleared in order for CreateSale request to be approved, which will be used by key sale_create_tasks:<asset_code>
//      //: instead of key-value
//      uint32* allTasks;
//  
//      //: reserved for future extension
//      EmptyExt ext;
//  };

//  ===========================================================================
public struct CreatePaymentRequestOp: XDRCodable {
  public var request: CreatePaymentRequest
  public var allTasks: Uint32?
  public var ext: EmptyExt

  public init(
      request: CreatePaymentRequest,
      allTasks: Uint32?,
      ext: EmptyExt) {

    self.request = request
    self.allTasks = allTasks
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.request.toXDR())
    xdr.append(self.allTasks.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.request = try CreatePaymentRequest(xdrData: &xdrData)
    if (try Bool(xdrData: &xdrData)) {
      self.allTasks = try Uint32(xdrData: &xdrData)
    } else {
      self.allTasks = nil
    }
    self.ext = try EmptyExt(xdrData: &xdrData)
  }
}
