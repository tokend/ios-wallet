// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct CreateManagerOfferRequestSuccessResult 
//  {
//      //: ID of the ManageOfferRequest
//      uint64 requestID;
//      //: Indicates whether or not the manage offer request was auto approved    
//      bool fulfilled;
//  
//      //: Result of manage offer application
//      ManageOfferResult* manageOfferResult;
//  
//      //: Reserved for future extension
//      EmptyExt ext;
//  };

//  ===========================================================================
public struct CreateManagerOfferRequestSuccessResult: XDRCodable {
  public var requestID: Uint64
  public var fulfilled: Bool
  public var manageOfferResult: ManageOfferResult?
  public var ext: EmptyExt

  public init(
      requestID: Uint64,
      fulfilled: Bool,
      manageOfferResult: ManageOfferResult?,
      ext: EmptyExt) {

    self.requestID = requestID
    self.fulfilled = fulfilled
    self.manageOfferResult = manageOfferResult
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.requestID.toXDR())
    xdr.append(self.fulfilled.toXDR())
    xdr.append(self.manageOfferResult.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.requestID = try Uint64(xdrData: &xdrData)
    self.fulfilled = try Bool(xdrData: &xdrData)
    if (try Bool(xdrData: &xdrData)) {
      self.manageOfferResult = try ManageOfferResult(xdrData: &xdrData)
    } else {
      self.manageOfferResult = nil
    }
    self.ext = try EmptyExt(xdrData: &xdrData)
  }
}
