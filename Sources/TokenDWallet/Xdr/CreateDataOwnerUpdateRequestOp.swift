// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct CreateDataOwnerUpdateRequestOp
//  {
//      //: ID of the DataOwnerUpdateRequest. If set to 0, a new request is created
//      uint64 requestID;
//  
//      DataOwnerUpdateRequest dataOwnerUpdateRequest;
//  
//      uint32* allTasks;
//  
//      //: Reserved for future extension
//      EmptyExt ext;
//  };

//  ===========================================================================
public struct CreateDataOwnerUpdateRequestOp: XDRCodable {
  public var requestID: Uint64
  public var dataOwnerUpdateRequest: DataOwnerUpdateRequest
  public var allTasks: Uint32?
  public var ext: EmptyExt

  public init(
      requestID: Uint64,
      dataOwnerUpdateRequest: DataOwnerUpdateRequest,
      allTasks: Uint32?,
      ext: EmptyExt) {

    self.requestID = requestID
    self.dataOwnerUpdateRequest = dataOwnerUpdateRequest
    self.allTasks = allTasks
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.dataOwnerUpdateRequest.toXDR())
    xdr.append(self.allTasks.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.requestID = try Uint64(xdrData: &xdrData)
    self.dataOwnerUpdateRequest = try DataOwnerUpdateRequest(xdrData: &xdrData)
    if (try Bool(xdrData: &xdrData)) {
      self.allTasks = try Uint32(xdrData: &xdrData)
    } else {
      self.allTasks = nil
    }
    self.ext = try EmptyExt(xdrData: &xdrData)
  }
}
