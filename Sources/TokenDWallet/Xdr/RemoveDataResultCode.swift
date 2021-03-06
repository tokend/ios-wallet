// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum RemoveDataResultCode 
//  {
//      //: Data successfully removed
//      SUCCESS = 0,
//      //: Entry with provided ID does not exist
//      NOT_FOUND = -1,
//      //: Only owner or admin can remove data.
//      NOT_AUTHORIZED = -2
//  };

//  ===========================================================================
public enum RemoveDataResultCode: Int32, XDREnum {
  case success = 0
  case notFound = -1
  case notAuthorized = -2
}
