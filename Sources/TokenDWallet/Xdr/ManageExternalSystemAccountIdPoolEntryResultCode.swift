// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum ManageExternalSystemAccountIdPoolEntryResultCode
//  {
//      //: Specified action in `actionInput` of ManageExternalSystemAccountIdPoolEntryOp
//      //: was successfully performed
//      SUCCESS = 0,
//  
//      // codes considered as "failure" for the operation
//      //: Not allowed to pass empty `data`
//      MALFORMED = -1,
//      //: Not allowed to create external system account ID pool with duplicated
//      //: data and external system type
//      ALREADY_EXISTS = -2,
//      //: There is no external system account ID pool with passed ID
//      NOT_FOUND = -3
//  };

//  ===========================================================================
public enum ManageExternalSystemAccountIdPoolEntryResultCode: Int32, XDREnum {
  case success = 0
  case malformed = -1
  case alreadyExists = -2
  case notFound = -3
}
