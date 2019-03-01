// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct AccountRuleEntry
//  {
//      uint64 id;
//  
//      AccountRuleResource resource;
//      AccountRuleAction action;
//  
//      bool forbids;
//  
//      longstring details;
//  
//      // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct AccountRuleEntry: XDREncodable {
  public var id: Uint64
  public var resource: AccountRuleResource
  public var action: AccountRuleAction
  public var forbids: Bool
  public var details: Longstring
  public var ext: AccountRuleEntryExt

  public init(
      id: Uint64,
      resource: AccountRuleResource,
      action: AccountRuleAction,
      forbids: Bool,
      details: Longstring,
      ext: AccountRuleEntryExt) {

    self.id = id
    self.resource = resource
    self.action = action
    self.forbids = forbids
    self.details = details
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.id.toXDR())
    xdr.append(self.resource.toXDR())
    xdr.append(self.action.toXDR())
    xdr.append(self.forbids.toXDR())
    xdr.append(self.details.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum AccountRuleEntryExt: XDRDiscriminatedUnion {
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
