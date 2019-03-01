// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct PeerAddress
//  {
//      union switch (IPAddrType type)
//      {
//      case IPv4:
//          opaque ipv4[4];
//      case IPv6:
//          opaque ipv6[16];
//      }
//      ip;
//      uint32 port;
//      uint32 numFailures;
//  };

//  ===========================================================================
public struct PeerAddress: XDREncodable {
  public var ip: PeerAddressIp
  public var port: Uint32
  public var numFailures: Uint32

  public init(
      ip: PeerAddressIp,
      port: Uint32,
      numFailures: Uint32) {

    self.ip = ip
    self.port = port
    self.numFailures = numFailures
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.ip.toXDR())
    xdr.append(self.port.toXDR())
    xdr.append(self.numFailures.toXDR())

    return xdr
  }

  public enum PeerAddressIp: XDRDiscriminatedUnion {
    case ipv4(XDRDataFixed4)
    case ipv6(XDRDataFixed16)

    public var discriminant: Int32 {
      switch self {
      case .ipv4: return IPAddrType.ipv4.rawValue
      case .ipv6: return IPAddrType.ipv6.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .ipv4(let data): xdr.append(data.toXDR())
      case .ipv6(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

  }
}
