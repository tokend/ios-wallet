// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result of operation applying
//  union InitiateKYCRecoveryResult switch (InitiateKYCRecoveryResultCode code)
//  {
//  case SUCCESS:
//      struct
//      {
//           //: reserved for future use
//           union switch (LedgerVersion v)
//           {
//           case EMPTY_VERSION:
//               void;
//           } ext;
//      } success;
//  default:
//      void;
//  };

//  ===========================================================================
public enum InitiateKYCRecoveryResult: XDRDiscriminatedUnion {
  case success(InitiateKYCRecoveryResultSuccess)

  public var discriminant: Int32 {
    switch self {
    case .success: return InitiateKYCRecoveryResultCode.success.rawValue
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
    case InitiateKYCRecoveryResultCode.success.rawValue:
      let data = try InitiateKYCRecoveryResultSuccess(xdrData: &xdrData)
      self = .success(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
  public struct InitiateKYCRecoveryResultSuccess: XDRCodable {
    public var ext: InitiateKYCRecoveryResultSuccessExt

    public init(
        ext: InitiateKYCRecoveryResultSuccessExt) {

      self.ext = ext
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.ext.toXDR())

      return xdr
    }

    public init(xdrData: inout Data) throws {
      self.ext = try InitiateKYCRecoveryResultSuccessExt(xdrData: &xdrData)
    }

    public enum InitiateKYCRecoveryResultSuccessExt: XDRDiscriminatedUnion {
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
}
