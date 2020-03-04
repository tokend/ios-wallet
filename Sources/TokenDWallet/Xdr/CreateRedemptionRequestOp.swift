// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CreateRedemptionRequest operation creates a reviewable request
//  //: that will transfer the specified amount from current holder's balance to destination balance after the reviewer's approval
//  struct CreateRedemptionRequestOp
//  {
//      //: Reference of RedemptionRequest
//      string64 reference; // TODO longstring ?
//      //: Parameters of RedemptionRequest
//      RedemptionRequest redemptionRequest;
//      //: (optional) Bit mask whose flags must be cleared in order for RedemptionRequest to be approved, which will be used by key redemption_tasks
//      //: instead of key-value
//      uint32* allTasks;
//  
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  
//  };

//  ===========================================================================
public struct CreateRedemptionRequestOp: XDRCodable {
  public var reference: String64
  public var redemptionRequest: RedemptionRequest
  public var allTasks: Uint32?
  public var ext: CreateRedemptionRequestOpExt

  public init(
      reference: String64,
      redemptionRequest: RedemptionRequest,
      allTasks: Uint32?,
      ext: CreateRedemptionRequestOpExt) {

    self.reference = reference
    self.redemptionRequest = redemptionRequest
    self.allTasks = allTasks
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.reference.toXDR())
    xdr.append(self.redemptionRequest.toXDR())
    xdr.append(self.allTasks.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.reference = try String64(xdrData: &xdrData)
    self.redemptionRequest = try RedemptionRequest(xdrData: &xdrData)
    if (try Bool(xdrData: &xdrData)) {
      self.allTasks = try Uint32(xdrData: &xdrData)
    } else {
      self.allTasks = nil
    }
    self.ext = try CreateRedemptionRequestOpExt(xdrData: &xdrData)
  }

  public enum CreateRedemptionRequestOpExt: XDRDiscriminatedUnion {
    case emptyVersion()

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion(): xdr.append(Data())
      }

      return xdr
    }

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case LedgerVersion.emptyVersion.rawValue: self = .emptyVersion()
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
}
