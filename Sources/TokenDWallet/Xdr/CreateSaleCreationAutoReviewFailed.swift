// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: specifies details on why an auto review has failed
//  struct CreateSaleCreationAutoReviewFailed {
//      //: auto review result
//      ReviewRequestResult reviewRequestRequest;
//      //: Reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct CreateSaleCreationAutoReviewFailed: XDRCodable {
  public var reviewRequestRequest: ReviewRequestResult
  public var ext: CreateSaleCreationAutoReviewFailedExt

  public init(
      reviewRequestRequest: ReviewRequestResult,
      ext: CreateSaleCreationAutoReviewFailedExt) {

    self.reviewRequestRequest = reviewRequestRequest
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.reviewRequestRequest.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.reviewRequestRequest = try ReviewRequestResult(xdrData: &xdrData)
    self.ext = try CreateSaleCreationAutoReviewFailedExt(xdrData: &xdrData)
  }

  public enum CreateSaleCreationAutoReviewFailedExt: XDRDiscriminatedUnion {
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

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case LedgerVersion.emptyVersion.rawValue: self = .emptyVersion()
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
}
