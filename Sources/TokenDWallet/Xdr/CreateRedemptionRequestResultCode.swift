// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result codes for CreateRedemption operation
//  enum CreateRedemptionRequestResultCode
//  {
//      // codes considered as "success" for the operation
//      //: Operation has been successfully performed
//      SUCCESS = 0,
//  
//      //codes considered as "failure" for the operation
//      //: Redemption is invalid
//      INVALID_REDEMPTION = -1,
//      //: Tasks for the redemption request were neither provided in the request nor loaded through KeyValue
//      REDEMPTION_TASKS_NOT_FOUND = -2,
//      //: Creator details must not be empty
//      INVALID_CREATOR_DETAILS = -3,
//      //: Amount must be greater then 0
//      INVALID_AMOUNT = -4,
//      //: Reference must not be longer then 64 bytes
//      INVALID_REFERENCE = -5,
//      //: Source balance with provided balance ID does not exist
//      SOURCE_BALANCE_NOT_EXIST = -6, // balance doesn't exist
//      //: Amount has incorrect precision
//      INCORRECT_PRECISION = -7,
//      //: Balance underfunded
//      UNDERFUNDED = -8,
//      //: Duplicated references are not allowed
//      REFERENCE_DUPLICATION = -9,
//      //: No destination with provided account ID
//      DST_ACCOUNT_NOT_FOUND = -10,
//      //: Not allowed to set zero tasks for request
//      REDEMPTION_ZERO_TASKS_NOT_ALLOWED = -11,
//      //: Not allowed to redeem non-owned asset
//      REDEMPTION_NON_OWNED_ASSET_FORBIDDEN = -12
//  };

//  ===========================================================================
public enum CreateRedemptionRequestResultCode: Int32, XDREnum {
  case success = 0
  case invalidRedemption = -1
  case redemptionTasksNotFound = -2
  case invalidCreatorDetails = -3
  case invalidAmount = -4
  case invalidReference = -5
  case sourceBalanceNotExist = -6
  case incorrectPrecision = -7
  case underfunded = -8
  case referenceDuplication = -9
  case dstAccountNotFound = -10
  case redemptionZeroTasksNotAllowed = -11
  case redemptionNonOwnedAssetForbidden = -12
}