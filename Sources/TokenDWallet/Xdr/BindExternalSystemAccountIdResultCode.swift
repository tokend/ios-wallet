// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum BindExternalSystemAccountIdResultCode
//  {
//      // codes considered as "success" for the operation
//      //: Source account successfully bound to external system ID taken from pool
//      SUCCESS = 0,
//  
//      // codes considered as "failure" for the operation
//      //: (deprecated)
//      MALFORMED = -1,
//      //: There is no available IDs from external system in pool for such external system type
//      NO_AVAILABLE_ID = -2
//  };

//  ===========================================================================
public enum BindExternalSystemAccountIdResultCode: Int32, XDREnum {
  case success = 0
  case malformed = -1
  case noAvailableId = -2
}