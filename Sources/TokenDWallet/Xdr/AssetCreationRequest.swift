// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: AssetCreationRequest is used to create an asset with provided parameters
//  struct AssetCreationRequest {
//      //: Code of an asset to create
//      AssetCode code;
//      //: Public key of a signer that will perform pre issuance
//      AccountID preissuedAssetSigner;
//      //: Maximal amount to be issued
//      uint64 maxIssuanceAmount;
//      //: Amount to pre issue on asset creation
//      uint64 initialPreissuedAmount;
//      //: Bit mask of policies to create an asset with
//      uint32 policies;
//      //: Arbitrary stringified JSON object that can be used to attach data to be reviewed by an admin
//      longstring creatorDetails; // details set by requester
//       //: Type of asset, selected arbitrarily. Can be used to restrict the usage of an asset
//      uint64 type;
//      //: Used to keep track of rejected requests updates (`SequenceNumber` increases after each rejected AssetCreationRequest update)
//      uint32 sequenceNumber;
//      //: Number of significant decimal places
//      uint32 trailingDigitsCount;
//  
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct AssetCreationRequest: XDRCodable {
  public var code: AssetCode
  public var preissuedAssetSigner: AccountID
  public var maxIssuanceAmount: Uint64
  public var initialPreissuedAmount: Uint64
  public var policies: Uint32
  public var creatorDetails: Longstring
  public var type: Uint64
  public var sequenceNumber: Uint32
  public var trailingDigitsCount: Uint32
  public var ext: AssetCreationRequestExt

  public init(
      code: AssetCode,
      preissuedAssetSigner: AccountID,
      maxIssuanceAmount: Uint64,
      initialPreissuedAmount: Uint64,
      policies: Uint32,
      creatorDetails: Longstring,
      type: Uint64,
      sequenceNumber: Uint32,
      trailingDigitsCount: Uint32,
      ext: AssetCreationRequestExt) {

    self.code = code
    self.preissuedAssetSigner = preissuedAssetSigner
    self.maxIssuanceAmount = maxIssuanceAmount
    self.initialPreissuedAmount = initialPreissuedAmount
    self.policies = policies
    self.creatorDetails = creatorDetails
    self.type = type
    self.sequenceNumber = sequenceNumber
    self.trailingDigitsCount = trailingDigitsCount
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.code.toXDR())
    xdr.append(self.preissuedAssetSigner.toXDR())
    xdr.append(self.maxIssuanceAmount.toXDR())
    xdr.append(self.initialPreissuedAmount.toXDR())
    xdr.append(self.policies.toXDR())
    xdr.append(self.creatorDetails.toXDR())
    xdr.append(self.type.toXDR())
    xdr.append(self.sequenceNumber.toXDR())
    xdr.append(self.trailingDigitsCount.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.code = try AssetCode(xdrData: &xdrData)
    self.preissuedAssetSigner = try AccountID(xdrData: &xdrData)
    self.maxIssuanceAmount = try Uint64(xdrData: &xdrData)
    self.initialPreissuedAmount = try Uint64(xdrData: &xdrData)
    self.policies = try Uint32(xdrData: &xdrData)
    self.creatorDetails = try Longstring(xdrData: &xdrData)
    self.type = try Uint64(xdrData: &xdrData)
    self.sequenceNumber = try Uint32(xdrData: &xdrData)
    self.trailingDigitsCount = try Uint32(xdrData: &xdrData)
    self.ext = try AssetCreationRequestExt(xdrData: &xdrData)
  }

  public enum AssetCreationRequestExt: XDRDiscriminatedUnion {
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
