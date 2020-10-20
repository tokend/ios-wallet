// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct CreateDataRemoveRequestOp
//  {
//      //: ID of the DataRemoveRequest. If set to 0, a new request is created
//      uint64 requestID;
//  
//      DataRemoveRequest dataRemoveRequest;
//  
//      uint32* allTasks;
//  
//      //: Reserved for future extension
//      EmptyExt ext;
//  };

//  ===========================================================================
public struct CreateDataRemoveRequestOp: XDRCodable {
  public var requestID: Uint64
  public var dataRemoveRequest: DataRemoveRequest
  public var allTasks: Uint32?
  public var ext: EmptyExt

  public init(
      requestID: Uint64,
      dataRemoveRequest: DataRemoveRequest,
      allTasks: Uint32?,
      ext: EmptyExt) {

    self.requestID = requestID
    self.dataRemoveRequest = dataRemoveRequest
    self.allTasks = allTasks
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.dataRemoveRequest.toXDR())
    xdr.append(self.allTasks.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.requestID = try Uint64(xdrData: &xdrData)
    self.dataRemoveRequest = try DataRemoveRequest(xdrData: &xdrData)
    if (try Bool(xdrData: &xdrData)) {
      self.allTasks = try Uint32(xdrData: &xdrData)
    } else {
      self.allTasks = nil
    }
    self.ext = try EmptyExt(xdrData: &xdrData)
  }
}
