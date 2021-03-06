// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: CreateAMLAlertRequest operation creates a reviewable request 
//  //: that will void the specified amount from target balance after the reviewer's approval
//  struct CreateAMLAlertRequestOp
//  {
//      //: Reference of AMLAlertRequest
//      string64 reference; // TODO longstring ?
//      //: Parameters of AMLAlertRequest
//      AMLAlertRequest amlAlertRequest;
//      //: (optional) Bit mask whose flags must be cleared in order for AMLAlertRequest to be approved, which will be used by key aml_alert_tasks:<asset_code>
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
public struct CreateAMLAlertRequestOp: XDRCodable {
  public var reference: String64
  public var amlAlertRequest: AMLAlertRequest
  public var allTasks: Uint32?
  public var ext: CreateAMLAlertRequestOpExt

  public init(
      reference: String64,
      amlAlertRequest: AMLAlertRequest,
      allTasks: Uint32?,
      ext: CreateAMLAlertRequestOpExt) {

    self.reference = reference
    self.amlAlertRequest = amlAlertRequest
    self.allTasks = allTasks
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.reference.toXDR())
    xdr.append(self.amlAlertRequest.toXDR())
    xdr.append(self.allTasks.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.reference = try String64(xdrData: &xdrData)
    self.amlAlertRequest = try AMLAlertRequest(xdrData: &xdrData)
    if (try Bool(xdrData: &xdrData)) {
      self.allTasks = try Uint32(xdrData: &xdrData)
    } else {
      self.allTasks = nil
    }
    self.ext = try CreateAMLAlertRequestOpExt(xdrData: &xdrData)
  }

  public enum CreateAMLAlertRequestOpExt: XDRDiscriminatedUnion {
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
