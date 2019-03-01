// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct Hello
//  {
//      uint32 ledgerVersion;
//      uint32 overlayVersion;
//      uint32 overlayMinVersion;
//      Hash networkID;
//      string versionStr<100>;
//      int listeningPort;
//      NodeID peerID;
//      AuthCert cert;
//      uint256 nonce;
//  };

//  ===========================================================================
public struct Hello: XDREncodable {
  public var ledgerVersion: Uint32
  public var overlayVersion: Uint32
  public var overlayMinVersion: Uint32
  public var networkID: Hash
  public var versionStr: String
  public var listeningPort: Int32
  public var peerID: NodeID
  public var cert: AuthCert
  public var nonce: Uint256

  public init(
      ledgerVersion: Uint32,
      overlayVersion: Uint32,
      overlayMinVersion: Uint32,
      networkID: Hash,
      versionStr: String,
      listeningPort: Int32,
      peerID: NodeID,
      cert: AuthCert,
      nonce: Uint256) {

    self.ledgerVersion = ledgerVersion
    self.overlayVersion = overlayVersion
    self.overlayMinVersion = overlayMinVersion
    self.networkID = networkID
    self.versionStr = versionStr
    self.listeningPort = listeningPort
    self.peerID = peerID
    self.cert = cert
    self.nonce = nonce
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.ledgerVersion.toXDR())
    xdr.append(self.overlayVersion.toXDR())
    xdr.append(self.overlayMinVersion.toXDR())
    xdr.append(self.networkID.toXDR())
    xdr.append(self.versionStr.toXDR())
    xdr.append(self.listeningPort.toXDR())
    xdr.append(self.peerID.toXDR())
    xdr.append(self.cert.toXDR())
    xdr.append(self.nonce.toXDR())

    return xdr
  }
}
