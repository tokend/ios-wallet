// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct PollEntry
//  {
//      uint64 id;
//      uint32 permissionType;
//  
//      uint32 numberOfChoices;
//      PollData data;
//  
//      uint64 startTime;
//      uint64 endTime;
//  
//      AccountID ownerID;
//      AccountID resultProviderID;
//  
//      bool voteConfirmationRequired;
//  
//      longstring details;
//  
//      EmptyExt ext;
//  };

//  ===========================================================================
public struct PollEntry: XDRCodable {
  public var id: Uint64
  public var permissionType: Uint32
  public var numberOfChoices: Uint32
  public var data: PollData
  public var startTime: Uint64
  public var endTime: Uint64
  public var ownerID: AccountID
  public var resultProviderID: AccountID
  public var voteConfirmationRequired: Bool
  public var details: Longstring
  public var ext: EmptyExt

  public init(
      id: Uint64,
      permissionType: Uint32,
      numberOfChoices: Uint32,
      data: PollData,
      startTime: Uint64,
      endTime: Uint64,
      ownerID: AccountID,
      resultProviderID: AccountID,
      voteConfirmationRequired: Bool,
      details: Longstring,
      ext: EmptyExt) {

    self.id = id
    self.permissionType = permissionType
    self.numberOfChoices = numberOfChoices
    self.data = data
    self.startTime = startTime
    self.endTime = endTime
    self.ownerID = ownerID
    self.resultProviderID = resultProviderID
    self.voteConfirmationRequired = voteConfirmationRequired
    self.details = details
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.id.toXDR())
    xdr.append(self.permissionType.toXDR())
    xdr.append(self.numberOfChoices.toXDR())
    xdr.append(self.data.toXDR())
    xdr.append(self.startTime.toXDR())
    xdr.append(self.endTime.toXDR())
    xdr.append(self.ownerID.toXDR())
    xdr.append(self.resultProviderID.toXDR())
    xdr.append(self.voteConfirmationRequired.toXDR())
    xdr.append(self.details.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.id = try Uint64(xdrData: &xdrData)
    self.permissionType = try Uint32(xdrData: &xdrData)
    self.numberOfChoices = try Uint32(xdrData: &xdrData)
    self.data = try PollData(xdrData: &xdrData)
    self.startTime = try Uint64(xdrData: &xdrData)
    self.endTime = try Uint64(xdrData: &xdrData)
    self.ownerID = try AccountID(xdrData: &xdrData)
    self.resultProviderID = try AccountID(xdrData: &xdrData)
    self.voteConfirmationRequired = try Bool(xdrData: &xdrData)
    self.details = try Longstring(xdrData: &xdrData)
    self.ext = try EmptyExt(xdrData: &xdrData)
  }
}
