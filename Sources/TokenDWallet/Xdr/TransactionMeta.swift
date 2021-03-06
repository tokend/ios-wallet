// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union TransactionMeta switch (LedgerVersion v)
//  {
//  case EMPTY_VERSION:
//      OperationMeta operations<>;
//  };

//  ===========================================================================
public enum TransactionMeta: XDRDiscriminatedUnion {
  case emptyVersion([OperationMeta])

  public var discriminant: Int32 {
    switch self {
    case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .emptyVersion(let data): xdr.append(data.toXDR())
    }

    return xdr
  }

  public init(xdrData: inout Data) throws {
    let discriminant = try Int32(xdrData: &xdrData)

    switch discriminant {
    case LedgerVersion.emptyVersion.rawValue:
      let lengthoperations = try Int32(xdrData: &xdrData)
      var data = [OperationMeta]()
      for _ in 1...lengthoperations {
        data.append(try OperationMeta(xdrData: &xdrData))
      }
      self = .emptyVersion(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}
