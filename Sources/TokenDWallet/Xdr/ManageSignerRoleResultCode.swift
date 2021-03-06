// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result codes of ManageSignerRoleResultCode
//  enum ManageSignerRoleResultCode
//  {
//      //: Means that the specified action in `data` of ManageSignerRoleOp was successfully executed
//      SUCCESS = 0,
//  
//      // codes considered as "failure" for the operation
//      //: There is no signer role with such id or the source cannot manage a role
//      NOT_FOUND = -1, // does not exist or owner mismatched
//      //: It is not allowed to remove role if it is attached to at least one singer
//      ROLE_IS_USED = -2,
//      //: Passed details have invalid json structure
//      INVALID_DETAILS = -3,
//      //: There is no rule with id passed through `ruleIDs`
//      NO_SUCH_RULE = -4,
//      //: It is not allowed to duplicate ids in `ruleIDs` array
//      RULE_ID_DUPLICATION = -5,
//      //: It is not allowed to pass ids of default rules on `ruleIDs` array
//      DEFAULT_RULE_ID_DUPLICATION = -6,
//      //: It is not allowed to pass ruleIDs that are more than maxSignerRuleCount (by default, 128)
//      TOO_MANY_RULE_IDS = -7
//  };

//  ===========================================================================
public enum ManageSignerRoleResultCode: Int32, XDREnum {
  case success = 0
  case notFound = -1
  case roleIsUsed = -2
  case invalidDetails = -3
  case noSuchRule = -4
  case ruleIdDuplication = -5
  case defaultRuleIdDuplication = -6
  case tooManyRuleIds = -7
}
