// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of operation application
//  union ManageSignerRuleResult switch (ManageSignerRuleResultCode code)
//  {
//      case SUCCESS:
//          struct {
//              //: id of the rule that was managed
//              uint64 ruleID;
//  
//              //: reserved for future use
//              union switch (LedgerVersion v)
//              {
//              case EMPTY_VERSION:
//                  void;
//              }
//              ext;
//          } success;
//      case RULE_IS_USED:
//          //: ids of roles which use a rule that cannot be removed
//          uint64 roleIDs<>;
//      default:
//          void;
//  };

//  ===========================================================================
public enum ManageSignerRuleResult: XDRDiscriminatedUnion {
  case success(ManageSignerRuleResultSuccess)
  case ruleIsUsed([Uint64])

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageSignerRuleResultCode.success.rawValue
    case .ruleIsUsed: return ManageSignerRuleResultCode.ruleIsUsed.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .success(let data): xdr.append(data.toXDR())
    case .ruleIsUsed(let data): xdr.append(data.toXDR())
    }

    return xdr
  }

  public init(xdrData: inout Data) throws {
    let discriminant = try Int32(xdrData: &xdrData)

    switch discriminant {
    case ManageSignerRuleResultCode.success.rawValue:
      let data = try ManageSignerRuleResultSuccess(xdrData: &xdrData)
      self = .success(data)
    case ManageSignerRuleResultCode.ruleIsUsed.rawValue:
      let lengthroleIDs = try Int32(xdrData: &xdrData)
      var data = [Uint64]()
      for _ in 1...lengthroleIDs {
        data.append(try Uint64(xdrData: &xdrData))
      }
      self = .ruleIsUsed(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
  public struct ManageSignerRuleResultSuccess: XDRCodable {
    public var ruleID: Uint64
    public var ext: ManageSignerRuleResultSuccessExt

    public init(
        ruleID: Uint64,
        ext: ManageSignerRuleResultSuccessExt) {

      self.ruleID = ruleID
      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.ruleID.toXDR())
      xdr.append(self.ext.toXDR())

      return xdr
    }

    public init(xdrData: inout Data) throws {
      self.ruleID = try Uint64(xdrData: &xdrData)
      self.ext = try ManageSignerRuleResultSuccessExt(xdrData: &xdrData)
    }

    public enum ManageSignerRuleResultSuccessExt: XDRDiscriminatedUnion {
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
}
