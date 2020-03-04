// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum PaymentResultCode
//  {
//      // codes considered as "success" for the operation
//      //: Payment was successfully completed
//      SUCCESS = 0, // payment successfully completed
//  
//      // codes considered as "failure" for the operation
//      //: Payment sender balance ID and payment receiver balance ID are equal or reference is longer than 64 symbols
//      MALFORMED = -1,
//      //: Not enough funds in the source account
//      UNDERFUNDED = -2,
//      //: After the payment fulfillment, the destination balance will exceed the limit (total amount on the balance will be greater than UINT64_MAX)
//      LINE_FULL = -3,
//      //: There is no balance found with an ID provided in `destinations.balanceID`
//      DESTINATION_BALANCE_NOT_FOUND = -4,
//      //: Sender balance asset and receiver balance asset are not equal
//      BALANCE_ASSETS_MISMATCHED = -5,
//      //: There is no balance found with ID provided in `sourceBalanceID`
//      SRC_BALANCE_NOT_FOUND = -6,
//      //: Pair `reference-sender account` of the payment is not unique
//      REFERENCE_DUPLICATION = -7,
//      //: Stats entry exceeded account limits
//      STATS_OVERFLOW = -8,
//      //: Account will exceed its limits after the payment is fulfilled
//      LIMITS_EXCEEDED = -9,
//      //: Payment asset does not have a `TRANSFERABLE` policy set
//      NOT_ALLOWED_BY_ASSET_POLICY = -10,
//      //: Overflow during total fee calculation
//      INVALID_DESTINATION_FEE = -11,
//      //: Payment fee amount is insufficient
//      INSUFFICIENT_FEE_AMOUNT = -12,
//      //: Fee charged from destination balance is greater than the payment amount
//      PAYMENT_AMOUNT_IS_LESS_THAN_DEST_FEE = -13,
//      //: There is no account found with an ID provided in `destination.accountID`
//      DESTINATION_ACCOUNT_NOT_FOUND = -14,
//      //: Amount precision and asset precision are mismatched
//      INCORRECT_AMOUNT_PRECISION = -15,
//      //: Too much signs in subject
//      INVALID_SUBJECT = -16
//  };

//  ===========================================================================
public enum PaymentResultCode: Int32, XDREnum {
  case success = 0
  case malformed = -1
  case underfunded = -2
  case lineFull = -3
  case destinationBalanceNotFound = -4
  case balanceAssetsMismatched = -5
  case srcBalanceNotFound = -6
  case referenceDuplication = -7
  case statsOverflow = -8
  case limitsExceeded = -9
  case notAllowedByAssetPolicy = -10
  case invalidDestinationFee = -11
  case insufficientFeeAmount = -12
  case paymentAmountIsLessThanDestFee = -13
  case destinationAccountNotFound = -14
  case incorrectAmountPrecision = -15
  case invalidSubject = -16
}
