// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct TransactionResultSet
//  {
//      TransactionResultPair results<>;
//  };

//  ===========================================================================
public struct TransactionResultSet: XDRCodable {
  public var results: [TransactionResultPair]

  public init(
      results: [TransactionResultPair]) {

    self.results = results
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.results.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    let lengthresults = try Int32(xdrData: &xdrData)
    self.results = [TransactionResultPair]()
    for _ in 1...lengthresults {
      self.results.append(try TransactionResultPair(xdrData: &xdrData))
    }
  }
}
