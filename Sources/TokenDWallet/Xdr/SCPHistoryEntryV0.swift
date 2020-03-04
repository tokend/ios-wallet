// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct SCPHistoryEntryV0
//  {
//      SCPQuorumSet quorumSets<>; // additional quorum sets used by ledgerMessages
//      LedgerSCPMessages ledgerMessages;
//  };

//  ===========================================================================
public struct SCPHistoryEntryV0: XDRCodable {
  public var quorumSets: [SCPQuorumSet]
  public var ledgerMessages: LedgerSCPMessages

  public init(
      quorumSets: [SCPQuorumSet],
      ledgerMessages: LedgerSCPMessages) {

    self.quorumSets = quorumSets
    self.ledgerMessages = ledgerMessages
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.quorumSets.toXDR())
    xdr.append(self.ledgerMessages.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    let lengthquorumSets = try Int32(xdrData: &xdrData)
    self.quorumSets = [SCPQuorumSet]()
    for _ in 1...lengthquorumSets {
      self.quorumSets.append(try SCPQuorumSet(xdrData: &xdrData))
    }
    self.ledgerMessages = try LedgerSCPMessages(xdrData: &xdrData)
  }
}
