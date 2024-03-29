// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct UpdateDataOwnerOp
//  {
//      //: ID of the data entry to update an owner
//      uint64 dataID;
//      //: A new owner of the entry
//      AccountID newOwner;
//      //: Reserved for future extension
//      EmptyExt ext;
//  };

//  ===========================================================================
public struct UpdateDataOwnerOp: XDRCodable {
  public var dataID: Uint64
  public var newOwner: AccountID
  public var ext: EmptyExt

  public init(
      dataID: Uint64,
      newOwner: AccountID,
      ext: EmptyExt) {

    self.dataID = dataID
    self.newOwner = newOwner
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.dataID.toXDR())
    xdr.append(self.newOwner.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.dataID = try Uint64(xdrData: &xdrData)
    self.newOwner = try AccountID(xdrData: &xdrData)
    self.ext = try EmptyExt(xdrData: &xdrData)
  }
}
