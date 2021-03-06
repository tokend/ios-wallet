// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct TasksExt {
//      // Tasks are represented by a bitmask
//      uint32 allTasks;
//      uint32 pendingTasks;
//  
//      // External details vector consists of comments written by request reviewers
//      longstring externalDetails<>;
//  
//      // Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct TasksExt: XDRCodable {
  public var allTasks: Uint32
  public var pendingTasks: Uint32
  public var externalDetails: [Longstring]
  public var ext: TasksExtExt

  public init(
      allTasks: Uint32,
      pendingTasks: Uint32,
      externalDetails: [Longstring],
      ext: TasksExtExt) {

    self.allTasks = allTasks
    self.pendingTasks = pendingTasks
    self.externalDetails = externalDetails
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.allTasks.toXDR())
    xdr.append(self.pendingTasks.toXDR())
    xdr.append(self.externalDetails.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.allTasks = try Uint32(xdrData: &xdrData)
    self.pendingTasks = try Uint32(xdrData: &xdrData)
    let lengthexternalDetails = try Int32(xdrData: &xdrData)
    self.externalDetails = [Longstring]()
    for _ in 1...lengthexternalDetails {
      self.externalDetails.append(try Longstring(xdrData: &xdrData))
    }
    self.ext = try TasksExtExt(xdrData: &xdrData)
  }

  public enum TasksExtExt: XDRDiscriminatedUnion {
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
