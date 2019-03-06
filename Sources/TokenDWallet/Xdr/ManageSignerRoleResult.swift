// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union ManageSignerRoleResult switch (ManageSignerRoleResultCode code)
//  {
//      //: Is used to pass useful params if operation is success
//      case SUCCESS:
//          struct
//          {
//              //: id of role which was managed
//              uint64 roleID;
//  
//              //: reserved for future use
//              union switch (LedgerVersion v)
//              {
//              case EMPTY_VERSION:
//                  void;
//              }
//              ext;
//          } success;
//      case RULE_ID_DUPLICATION:
//      case DEFAULT_RULE_ID_DUPLICATION:
//      case NO_SUCH_RULE:
//          //: ID of rule which was duplicated or is default or does not exist
//          uint64 ruleID;
//      case TOO_MANY_RULE_IDS:
//          //: max count of rule ids that can be passed in `ruleIDs` array
//          uint64 maxRuleIDsCount;
//      default:
//          void;
//  };

//  ===========================================================================
public enum ManageSignerRoleResult: XDRDiscriminatedUnion {
  case success(ManageSignerRoleResultSuccess)
  case ruleIdDuplication(Uint64)
  case defaultRuleIdDuplication(Uint64)
  case noSuchRule(Uint64)
  case tooManyRuleIds(Uint64)

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageSignerRoleResultCode.success.rawValue
    case .ruleIdDuplication: return ManageSignerRoleResultCode.ruleIdDuplication.rawValue
    case .defaultRuleIdDuplication: return ManageSignerRoleResultCode.defaultRuleIdDuplication.rawValue
    case .noSuchRule: return ManageSignerRoleResultCode.noSuchRule.rawValue
    case .tooManyRuleIds: return ManageSignerRoleResultCode.tooManyRuleIds.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .success(let data): xdr.append(data.toXDR())
    case .ruleIdDuplication(let data): xdr.append(data.toXDR())
    case .defaultRuleIdDuplication(let data): xdr.append(data.toXDR())
    case .noSuchRule(let data): xdr.append(data.toXDR())
    case .tooManyRuleIds(let data): xdr.append(data.toXDR())
    }

    return xdr
  }
  public struct ManageSignerRoleResultSuccess: XDREncodable {
    public var roleID: Uint64
    public var ext: ManageSignerRoleResultSuccessExt

    public init(
        roleID: Uint64,
        ext: ManageSignerRoleResultSuccessExt) {

      self.roleID = roleID
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.roleID.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

    public enum ManageSignerRoleResultSuccessExt: XDRDiscriminatedUnion {
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

    }
  }
}