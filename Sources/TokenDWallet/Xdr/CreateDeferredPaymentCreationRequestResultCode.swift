// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result codes of CreateAtomicSwapBidRequestOp
//  enum CreateDeferredPaymentCreationRequestResultCode
//  {
//      //: `CREATE_DEFERRED_PAYMENT` request has either been successfully created
//      //: or auto approved
//      SUCCESS = 0,
//  
//      SOURCE_BALANCE_NOT_FOUND = -1,
//      DESTINATION_ACCOUNT_NOT_FOUND = -2,
//      INCORRECT_PRECISION = -3,
//      UNDERFUNDED = -4,
//      TASKS_NOT_FOUND = -5,
//      INVALID_CREATOR_DETAILS = -6,
//      INVALID_AMOUNT = -7,
//      REQUEST_NOT_FOUND = -8
//  };

//  ===========================================================================
public enum CreateDeferredPaymentCreationRequestResultCode: Int32, XDREnum {
  case success = 0
  case sourceBalanceNotFound = -1
  case destinationAccountNotFound = -2
  case incorrectPrecision = -3
  case underfunded = -4
  case tasksNotFound = -5
  case invalidCreatorDetails = -6
  case invalidAmount = -7
  case requestNotFound = -8
}
