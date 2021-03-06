// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CreatePollRequest is used to create poll entry with passed fields
//  struct CreatePollRequest
//  {
//      //: is used to restrict using of poll through rules
//      uint32 permissionType;
//  
//      //: Number of allowed choices
//      uint32 numberOfChoices;
//  
//      //: Specification of poll
//      PollData data;
//  
//      //: Arbitrary stringified json object with details about the poll
//      longstring creatorDetails; // details set by requester
//  
//      //: The date from which voting in the poll will be allowed
//      uint64 startTime;
//  
//      //: The date until which voting in the poll will be allowed
//      uint64 endTime;
//  
//      //: ID of account which is responsible for poll result submitting
//      AccountID resultProviderID;
//  
//      //: True means that signature of `resultProvider` is required to participate in poll voting
//      bool voteConfirmationRequired;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct CreatePollRequest: XDRCodable {
  public var permissionType: Uint32
  public var numberOfChoices: Uint32
  public var data: PollData
  public var creatorDetails: Longstring
  public var startTime: Uint64
  public var endTime: Uint64
  public var resultProviderID: AccountID
  public var voteConfirmationRequired: Bool
  public var ext: CreatePollRequestExt

  public init(
      permissionType: Uint32,
      numberOfChoices: Uint32,
      data: PollData,
      creatorDetails: Longstring,
      startTime: Uint64,
      endTime: Uint64,
      resultProviderID: AccountID,
      voteConfirmationRequired: Bool,
      ext: CreatePollRequestExt) {

    self.permissionType = permissionType
    self.numberOfChoices = numberOfChoices
    self.data = data
    self.creatorDetails = creatorDetails
    self.startTime = startTime
    self.endTime = endTime
    self.resultProviderID = resultProviderID
    self.voteConfirmationRequired = voteConfirmationRequired
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.permissionType.toXDR())
    xdr.append(self.numberOfChoices.toXDR())
    xdr.append(self.data.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.startTime.toXDR())
    xdr.append(self.endTime.toXDR())
    xdr.append(self.resultProviderID.toXDR())
    xdr.append(self.voteConfirmationRequired.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.permissionType = try Uint32(xdrData: &xdrData)
    self.numberOfChoices = try Uint32(xdrData: &xdrData)
    self.data = try PollData(xdrData: &xdrData)
    self.creatorDetails = try Longstring(xdrData: &xdrData)
    self.startTime = try Uint64(xdrData: &xdrData)
    self.endTime = try Uint64(xdrData: &xdrData)
    self.resultProviderID = try AccountID(xdrData: &xdrData)
    self.voteConfirmationRequired = try Bool(xdrData: &xdrData)
    self.ext = try CreatePollRequestExt(xdrData: &xdrData)
  }

  public enum CreatePollRequestExt: XDRDiscriminatedUnion {
    case emptyVersion

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion: xdr.append(Data())
      }

      return xdr
    }

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case LedgerVersion.emptyVersion.rawValue: self = .emptyVersion
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
}
