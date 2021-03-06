// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union LedgerEntryChange switch (LedgerEntryChangeType type)
//  {
//  case CREATED:
//      LedgerEntry created;
//  case UPDATED:
//      LedgerEntry updated;
//  case REMOVED:
//      LedgerKey removed;
//  case STATE:
//      LedgerEntry state;
//  };

//  ===========================================================================
public enum LedgerEntryChange: XDRDiscriminatedUnion {
  case created(LedgerEntry)
  case updated(LedgerEntry)
  case removed(LedgerKey)
  case state(LedgerEntry)

  public var discriminant: Int32 {
    switch self {
    case .created: return LedgerEntryChangeType.created.rawValue
    case .updated: return LedgerEntryChangeType.updated.rawValue
    case .removed: return LedgerEntryChangeType.removed.rawValue
    case .state: return LedgerEntryChangeType.state.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .created(let data): xdr.append(data.toXDR())
    case .updated(let data): xdr.append(data.toXDR())
    case .removed(let data): xdr.append(data.toXDR())
    case .state(let data): xdr.append(data.toXDR())
    }

    return xdr
  }

  public init(xdrData: inout Data) throws {
    let discriminant = try Int32(xdrData: &xdrData)

    switch discriminant {
    case LedgerEntryChangeType.created.rawValue:
      let data = try LedgerEntry(xdrData: &xdrData)
      self = .created(data)
    case LedgerEntryChangeType.updated.rawValue:
      let data = try LedgerEntry(xdrData: &xdrData)
      self = .updated(data)
    case LedgerEntryChangeType.removed.rawValue:
      let data = try LedgerKey(xdrData: &xdrData)
      self = .removed(data)
    case LedgerEntryChangeType.state.rawValue:
      let data = try LedgerEntry(xdrData: &xdrData)
      self = .state(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}
