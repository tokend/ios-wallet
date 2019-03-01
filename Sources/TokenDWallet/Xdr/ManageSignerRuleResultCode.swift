// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum ManageSignerRuleResultCode
//  {
//      //: Means that specified action in `data` of ManageSignerRuleOp was successfully executed
//      SUCCESS = 0,
//  
//      // codes considered as "failure" for the operation
//      //: There is no signer rule with such id or source cannot manage the rule
//      NOT_FOUND = -1, // does not exists or owner mismatched
//      //: Not allowed to remove rule if it is attached at least to one role
//      RULE_IS_USED = -2,
//      //: Passed details has invalid json structure
//      INVALID_DETAILS = -3
//  };

//  ===========================================================================
public enum ManageSignerRuleResultCode: Int32, XDREnum {
  case success = 0
  case notFound = -1
  case ruleIsUsed = -2
  case invalidDetails = -3
}
