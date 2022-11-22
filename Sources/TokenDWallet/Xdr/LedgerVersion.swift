// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum LedgerVersion
//  {
//      EMPTY_VERSION = 0,
//      CHECK_SET_FEE_ACCOUNT_EXISTING = 1,
//      FIX_PAYMENT_STATS = 2,
//      ADD_INVEST_FEE = 3,
//      ADD_SALE_WHITELISTS = 4,
//      ASSET_PAIR_RESTRICTIONS = 5,
//      FIX_CHANGE_TO_NON_EXISTING_ROLE = 6,
//      FIX_REVERSE_SALE_PAIR = 7,
//      FIX_NOT_CHECKING_SET_TASKS_PERMISSIONS = 8,
//      UNLIMITED_ADMIN_COUNT = 9,
//      FIX_AML_ALERT_ERROR_CODES = 10,
//      FIX_EXT_SYS_ACC_EXPIRATION_TIME = 11,
//      FIX_CHANGE_ROLE_REJECT_TASKS = 12,
//      FIX_SAME_ASSET_PAIR = 13,
//      ATOMIC_SWAP_RETURNING = 14,
//      FIX_INVEST_FEE = 15,
//      ADD_ACC_SPECIFIC_RULE_RESOURCE = 16,
//      FIX_SIGNER_CHANGES_REMOVE = 17,
//      FIX_DEPOSIT_STATS = 18,
//      FIX_CREATE_KYC_RECOVERY_PERMISSIONS = 19,
//      CLEAR_DATABASE_CACHE = 20,
//      FIX_ISSUANCE_REVIEWER = 21,
//      MARK_ASSET_AS_DELETED = 22,
//      FIX_MAX_SUBJECT_SIZE = 23,
//      FIX_MOVEMENT_REVIEW = 24,
//      FIX_SIGNATURE_CHECK = 25,
//      FIX_AUTOREVIEW = 26,
//      MOVEMENT_REQUESTS_DETAILS = 27,
//      FIX_CRASH_CORE_WITH_PAYMENT = 28,
//      FIX_INVEST_TO_IMMEDIATE_SALE = 29,
//      FIX_PAYMENT_TASKS_WILDCARD_VALUE = 30,
//      FIX_CHANGE_ROLE_REQUEST_REQUESTOR = 31,
//      FIX_UNORDERED_FEE_DESTINATION = 32,
//      ADD_DEFAULT_FEE_RECEIVER_BALANCE_KV = 33,
//      DELETE_REDEMPTION_ZERO_TASKS_CHECKING = 34,
//      FIX_DATA_OWNERSHIP_TRANSFER_OWNER_CHECK = 35
//  };

//  ===========================================================================
public enum LedgerVersion: Int32, XDREnum {
  case emptyVersion = 0
  case checkSetFeeAccountExisting = 1
  case fixPaymentStats = 2
  case addInvestFee = 3
  case addSaleWhitelists = 4
  case assetPairRestrictions = 5
  case fixChangeToNonExistingRole = 6
  case fixReverseSalePair = 7
  case fixNotCheckingSetTasksPermissions = 8
  case unlimitedAdminCount = 9
  case fixAmlAlertErrorCodes = 10
  case fixExtSysAccExpirationTime = 11
  case fixChangeRoleRejectTasks = 12
  case fixSameAssetPair = 13
  case atomicSwapReturning = 14
  case fixInvestFee = 15
  case addAccSpecificRuleResource = 16
  case fixSignerChangesRemove = 17
  case fixDepositStats = 18
  case fixCreateKycRecoveryPermissions = 19
  case clearDatabaseCache = 20
  case fixIssuanceReviewer = 21
  case markAssetAsDeleted = 22
  case fixMaxSubjectSize = 23
  case fixMovementReview = 24
  case fixSignatureCheck = 25
  case fixAutoreview = 26
  case movementRequestsDetails = 27
  case fixCrashCoreWithPayment = 28
  case fixInvestToImmediateSale = 29
  case fixPaymentTasksWildcardValue = 30
  case fixChangeRoleRequestRequestor = 31
  case fixUnorderedFeeDestination = 32
  case addDefaultFeeReceiverBalanceKv = 33
  case deleteRedemptionZeroTasksChecking = 34
  case fixDataOwnershipTransferOwnerCheck = 35
}
