// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of operation applying
//  union ManageAccountSpecificRuleResult switch (ManageAccountSpecificRuleResultCode code)
//  {
//  case SUCCESS:
//      //: Is used to pass useful params if operation is success
//      struct {
//          //: id of the rule that was managed
//          uint64 ruleID;
//  
//          //: reserved for future use
//          union switch (LedgerVersion v)
//          {
//          case EMPTY_VERSION:
//              void;
//          }
//          ext;
//      } success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum ManageAccountSpecificRuleResult: XDRDiscriminatedUnion {
  case success(ManageAccountSpecificRuleResultSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return ManageAccountSpecificRuleResultCode.success.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .success(let data): xdr.append(data.toXDR())
    }

    return xdr
  }

  public init(xdrData: inout Data) throws {
    let discriminant = try Int32(xdrData: &xdrData)

    switch discriminant {
    case ManageAccountSpecificRuleResultCode.success.rawValue:
      let data = try ManageAccountSpecificRuleResultSuccess(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
  public struct ManageAccountSpecificRuleResultSuccess: XDRCodable {
    public var ruleID: Uint64
    public var ext: ManageAccountSpecificRuleResultSuccessExt

    public init(
        ruleID: Uint64,
        ext: ManageAccountSpecificRuleResultSuccessExt) {

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
      self.ext = try ManageAccountSpecificRuleResultSuccessExt(xdrData: &xdrData)
    }

    public enum ManageAccountSpecificRuleResultSuccessExt: XDRDiscriminatedUnion {
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
}
