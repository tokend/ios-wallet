// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: InitiateKYCRecoveryOp is used to start KYC recovery process
//  struct InitiateKYCRecoveryOp
//  {
//      //: Address of account to be recovered
//      AccountID account;
//      //: New signer to set
//      PublicKey signer;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      } ext;
//  };

//  ===========================================================================
public struct InitiateKYCRecoveryOp: XDREncodable {
  public var account: AccountID
  public var signer: PublicKey
  public var ext: InitiateKYCRecoveryOpExt

  public init(
      account: AccountID,
      signer: PublicKey,
      ext: InitiateKYCRecoveryOpExt) {

    self.account = account
    self.signer = signer
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.account.toXDR())
    xdr.append(self.signer.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public enum InitiateKYCRecoveryOpExt: XDRDiscriminatedUnion {
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