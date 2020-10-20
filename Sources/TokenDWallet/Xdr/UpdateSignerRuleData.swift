// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: UpdateSignerRuleData is used to pass necessary params to update an existing signer rule
//  struct UpdateSignerRuleData
//  {
//      //: Identifier of an existing signer rule
//      uint64 ruleID;
//      //: Resource is used to specify entity (for some, with properties) that can be managed through operations
//      SignerRuleResource resource;
//      //: Value from enum that can be applied to `resource`
//      SignerRuleAction action;
//      //: True means that such rule will be automatically added to each new or updated signer role
//      bool forbids;
//      //: True means that no one can manage such rule after creating
//      bool isDefault;
//      //: Arbitrary stringified json object with details that will be attached to a rule
//      longstring details;
//  
//      // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct UpdateSignerRuleData: XDRCodable {
  public var ruleID: Uint64
  public var resource: SignerRuleResource
  public var action: SignerRuleAction
  public var forbids: Bool
  public var isDefault: Bool
  public var details: Longstring
  public var ext: UpdateSignerRuleDataExt

  public init(
      ruleID: Uint64,
      resource: SignerRuleResource,
      action: SignerRuleAction,
      forbids: Bool,
      isDefault: Bool,
      details: Longstring,
      ext: UpdateSignerRuleDataExt) {

    self.ruleID = ruleID
    self.resource = resource
    self.action = action
    self.forbids = forbids
    self.isDefault = isDefault
    self.details = details
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.ruleID.toXDR())
    xdr.append(self.resource.toXDR())
    xdr.append(self.action.toXDR())
    xdr.append(self.forbids.toXDR())
    xdr.append(self.isDefault.toXDR())
    xdr.append(self.details.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.ruleID = try Uint64(xdrData: &xdrData)
    self.resource = try SignerRuleResource(xdrData: &xdrData)
    self.action = try SignerRuleAction(xdrData: &xdrData)
    self.forbids = try Bool(xdrData: &xdrData)
    self.isDefault = try Bool(xdrData: &xdrData)
    self.details = try Longstring(xdrData: &xdrData)
    self.ext = try UpdateSignerRuleDataExt(xdrData: &xdrData)
  }

  public enum UpdateSignerRuleDataExt: XDRDiscriminatedUnion {
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
