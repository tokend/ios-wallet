// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: ManagePollOp is used to close,  update end time or cancel the poll
//  struct ManagePollOp
//  {
//      //: ID of poll to manage
//      uint64 pollID;
//  
//      //: data is used to pass one of `ManagePollAction` with required params
//      union switch (ManagePollAction action)
//      {
//      case CLOSE:
//          ClosePollData closePollData;
//      case UPDATE_END_TIME:
//          UpdatePollEndTimeData updateTimeData;
//      case CANCEL:
//          EmptyExt ext;
//      }
//      data;
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
public struct ManagePollOp: XDRCodable {
  public var pollID: Uint64
  public var data: ManagePollOpData
  public var ext: ManagePollOpExt

  public init(
      pollID: Uint64,
      data: ManagePollOpData,
      ext: ManagePollOpExt) {

    self.pollID = pollID
    self.data = data
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.pollID.toXDR())
    xdr.append(self.data.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.pollID = try Uint64(xdrData: &xdrData)
    self.data = try ManagePollOpData(xdrData: &xdrData)
    self.ext = try ManagePollOpExt(xdrData: &xdrData)
  }

  public enum ManagePollOpData: XDRDiscriminatedUnion {
    case close(ClosePollData)
    case updateEndTime(UpdatePollEndTimeData)
    case cancel(EmptyExt)

    public var discriminant: Int32 {
      switch self {
      case .close: return ManagePollAction.close.rawValue
      case .updateEndTime: return ManagePollAction.updateEndTime.rawValue
      case .cancel: return ManagePollAction.cancel.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .close(let data): xdr.append(data.toXDR())
      case .updateEndTime(let data): xdr.append(data.toXDR())
      case .cancel(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case ManagePollAction.close.rawValue:
        let data = try ClosePollData(xdrData: &xdrData)
        self = .close(data)
      case ManagePollAction.updateEndTime.rawValue:
        let data = try UpdatePollEndTimeData(xdrData: &xdrData)
        self = .updateEndTime(data)
      case ManagePollAction.cancel.rawValue:
        let data = try EmptyExt(xdrData: &xdrData)
        self = .cancel(data)
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
  public enum ManagePollOpExt: XDRDiscriminatedUnion {
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
