// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union OperationResult switch (OperationResultCode code)
//  {
//  case opINNER:
//      union switch (OperationType type)
//      {
//      case CREATE_ACCOUNT:
//          CreateAccountResult createAccountResult;
//  	case CREATE_ISSUANCE_REQUEST:
//  		CreateIssuanceRequestResult createIssuanceRequestResult;
//      case SET_FEES:
//          SetFeesResult setFeesResult;
//      case CREATE_WITHDRAWAL_REQUEST:
//  		CreateWithdrawalRequestResult createWithdrawalRequestResult;
//      case MANAGE_BALANCE:
//          ManageBalanceResult manageBalanceResult;
//      case MANAGE_ASSET:
//          ManageAssetResult manageAssetResult;
//      case CREATE_PREISSUANCE_REQUEST:
//          CreatePreIssuanceRequestResult createPreIssuanceRequestResult;
//      case MANAGE_LIMITS:
//          ManageLimitsResult manageLimitsResult;
//  	case MANAGE_ASSET_PAIR:
//  		ManageAssetPairResult manageAssetPairResult;
//  	case MANAGE_OFFER:
//  		ManageOfferResult manageOfferResult;
//  	case MANAGE_INVOICE_REQUEST:
//  		ManageInvoiceRequestResult manageInvoiceRequestResult;
//  	case REVIEW_REQUEST:
//  		ReviewRequestResult reviewRequestResult;
//  	case CREATE_SALE_REQUEST:
//  		CreateSaleCreationRequestResult createSaleCreationRequestResult;
//  	case CHECK_SALE_STATE:
//  		CheckSaleStateResult checkSaleStateResult;
//  	case PAYOUT:
//  	    PayoutResult payoutResult;
//  	case CREATE_AML_ALERT:
//  	    CreateAMLAlertRequestResult createAMLAlertRequestResult;
//  	case MANAGE_KEY_VALUE:
//  	    ManageKeyValueResult manageKeyValueResult;
//  	case CREATE_CHANGE_ROLE_REQUEST:
//  	    CreateChangeRoleRequestResult createChangeRoleRequestResult;
//      case MANAGE_EXTERNAL_SYSTEM_ACCOUNT_ID_POOL_ENTRY:
//          ManageExternalSystemAccountIdPoolEntryResult manageExternalSystemAccountIdPoolEntryResult;
//      case BIND_EXTERNAL_SYSTEM_ACCOUNT_ID:
//          BindExternalSystemAccountIdResult bindExternalSystemAccountIdResult;
//      case PAYMENT:
//          PaymentResult paymentResult;
//      case MANAGE_SALE:
//          ManageSaleResult manageSaleResult;
//      case CREATE_MANAGE_LIMITS_REQUEST:
//          CreateManageLimitsRequestResult createManageLimitsRequestResult;
//      case MANAGE_CONTRACT_REQUEST:
//          ManageContractRequestResult manageContractRequestResult;
//      case MANAGE_CONTRACT:
//          ManageContractResult manageContractResult;
//      case CANCEL_SALE_REQUEST:
//          CancelSaleCreationRequestResult cancelSaleCreationRequestResult;
//      case CREATE_ATOMIC_SWAP_ASK_REQUEST:
//          CreateAtomicSwapAskRequestResult createAtomicSwapAskRequestResult;
//      case CANCEL_ATOMIC_SWAP_ASK:
//          CancelAtomicSwapAskResult cancelAtomicSwapAskResult;
//      case CREATE_ATOMIC_SWAP_BID_REQUEST:
//          CreateAtomicSwapBidRequestResult createAtomicSwapBidRequestResult;
//      case MANAGE_ACCOUNT_ROLE:
//          ManageAccountRoleResult manageAccountRoleResult;
//      case MANAGE_ACCOUNT_RULE:
//          ManageAccountRuleResult manageAccountRuleResult;
//      case MANAGE_SIGNER:
//          ManageSignerResult manageSignerResult;
//      case MANAGE_SIGNER_ROLE:
//          ManageSignerRoleResult manageSignerRoleResult;
//      case MANAGE_SIGNER_RULE:
//          ManageSignerRuleResult manageSignerRuleResult;
//      case STAMP:
//          StampResult stampResult;
//      case LICENSE:
//          LicenseResult licenseResult;
//      case MANAGE_POLL:
//          ManagePollResult managePollResult;
//      case MANAGE_CREATE_POLL_REQUEST:
//          ManageCreatePollRequestResult manageCreatePollRequestResult;
//      case MANAGE_VOTE:
//          ManageVoteResult manageVoteResult;
//      case MANAGE_ACCOUNT_SPECIFIC_RULE:
//          ManageAccountSpecificRuleResult manageAccountSpecificRuleResult;
//      case CANCEL_CHANGE_ROLE_REQUEST:
//          CancelChangeRoleRequestResult cancelChangeRoleRequestResult;
//      case REMOVE_ASSET_PAIR:
//          RemoveAssetPairResult removeAssetPairResult;
//      case CREATE_KYC_RECOVERY_REQUEST:
//          CreateKYCRecoveryRequestResult createKYCRecoveryRequestResult;
//      case INITIATE_KYC_RECOVERY:
//          InitiateKYCRecoveryResult initiateKYCRecoveryResult;
//      case CREATE_MANAGE_OFFER_REQUEST:
//          CreateManageOfferRequestResult createManageOfferRequestResult;
//      case CREATE_PAYMENT_REQUEST:
//          CreatePaymentRequestResult createPaymentRequestResult;
//      case REMOVE_ASSET:
//          RemoveAssetResult removeAssetResult;
//      case OPEN_SWAP:
//          OpenSwapResult openSwapResult;
//      case CLOSE_SWAP:
//          CloseSwapResult closeSwapResult;
//      case CREATE_REDEMPTION_REQUEST:
//          CreateRedemptionRequestResult createRedemptionRequestResult;
//      case CREATE_DATA:
//          CreateDataResult createDataResult;
//      case UPDATE_DATA:
//          UpdateDataResult updateDataResult;
//      case REMOVE_DATA:
//          RemoveDataResult removeDataResult;
//      case CREATE_DATA_CREATION_REQUEST:
//          CreateDataCreationRequestResult createDataCreationRequestResult;
//      case CANCEL_DATA_CREATION_REQUEST:
//          CancelDataCreationRequestResult cancelDataCreationRequestResult;
//      case CREATE_DATA_UPDATE_REQUEST:
//          CreateDataUpdateRequestResult createDataUpdateRequestResult;
//      case CREATE_DATA_REMOVE_REQUEST:
//          CreateDataRemoveRequestResult createDataRemoveRequestResult;
//      case CANCEL_DATA_UPDATE_REQUEST:
//          CancelDataUpdateRequestResult cancelDataUpdateRequestResult;
//      case CANCEL_DATA_REMOVE_REQUEST:
//          CancelDataRemoveRequestResult cancelDataRemoveRequestResult;
//      case CREATE_DEFERRED_PAYMENT_CREATION_REQUEST:
//          CreateDeferredPaymentCreationRequestResult createDeferredPaymentCreationRequestResult;
//      case CANCEL_DEFERRED_PAYMENT_CREATION_REQUEST:
//          CancelDeferredPaymentCreationRequestResult cancelDeferredPaymentCreationRequestResult;
//      case CREATE_CLOSE_DEFERRED_PAYMENT_REQUEST:
//          CreateCloseDeferredPaymentRequestResult createCloseDeferredPaymentRequestResult;
//      case CANCEL_CLOSE_DEFERRED_PAYMENT_REQUEST:
//          CancelCloseDeferredPaymentRequestResult cancelCloseDeferredPaymentRequestResult;
//      case LP_SWAP:
//          LPSwapResult lpSwapResult;
//      case LP_ADD_LIQUIDITY:
//          LPAddLiquidityResult lpAddLiquidityResult;
//      case LP_REMOVE_LIQUIDITY:
//          LPRemoveLiquidityResult lpRemoveLiquidityResult;
//      case UPDATE_DATA_OWNER:
//          UpdateDataOwnerResult updateDataOwnerResult;
//      case CREATE_DATA_OWNER_UPDATE_REQUEST:
//          CreateDataOwnerUpdateRequestResult createDataOwnerUpdateRequestResult;
//      case CANCEL_DATA_OWNER_UPDATE_REQUEST:
//          CancelDataOwnerUpdateRequestResult cancelDataOwnerUpdateRequestResult;
//      }
//      tr;
//  case opNO_ENTRY:
//      LedgerEntryType entryType;
//  case opNO_ROLE_PERMISSION:
//      AccountRuleRequirement requirement;
//  default:
//      void;
//  };

//  ===========================================================================
public enum OperationResult: XDRDiscriminatedUnion {
  case opinner(OperationResultTr)
  case opnoEntry(LedgerEntryType)
  case opnoRolePermission(AccountRuleRequirement)

  public var discriminant: Int32 {
    switch self {
    case .opinner: return OperationResultCode.opinner.rawValue
    case .opnoEntry: return OperationResultCode.opnoEntry.rawValue
    case .opnoRolePermission: return OperationResultCode.opnoRolePermission.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .opinner(let data): xdr.append(data.toXDR())
    case .opnoEntry(let data): xdr.append(data.toXDR())
    case .opnoRolePermission(let data): xdr.append(data.toXDR())
    }

    return xdr
  }

  public init(xdrData: inout Data) throws {
    let discriminant = try Int32(xdrData: &xdrData)

    switch discriminant {
    case OperationResultCode.opinner.rawValue:
      let data = try OperationResultTr(xdrData: &xdrData)
      self = .opinner(data)
    case OperationResultCode.opnoEntry.rawValue:
      let data = try LedgerEntryType(xdrData: &xdrData)
      self = .opnoEntry(data)
    case OperationResultCode.opnoRolePermission.rawValue:
      let data = try AccountRuleRequirement(xdrData: &xdrData)
      self = .opnoRolePermission(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
  public enum OperationResultTr: XDRDiscriminatedUnion {
    case createAccount(CreateAccountResult)
    case createIssuanceRequest(CreateIssuanceRequestResult)
    case setFees(SetFeesResult)
    case createWithdrawalRequest(CreateWithdrawalRequestResult)
    case manageBalance(ManageBalanceResult)
    case manageAsset(ManageAssetResult)
    case createPreissuanceRequest(CreatePreIssuanceRequestResult)
    case manageLimits(ManageLimitsResult)
    case manageAssetPair(ManageAssetPairResult)
    case manageOffer(ManageOfferResult)
    case manageInvoiceRequest(ManageInvoiceRequestResult)
    case reviewRequest(ReviewRequestResult)
    case createSaleRequest(CreateSaleCreationRequestResult)
    case checkSaleState(CheckSaleStateResult)
    case payout(PayoutResult)
    case createAmlAlert(CreateAMLAlertRequestResult)
    case manageKeyValue(ManageKeyValueResult)
    case createChangeRoleRequest(CreateChangeRoleRequestResult)
    case manageExternalSystemAccountIdPoolEntry(ManageExternalSystemAccountIdPoolEntryResult)
    case bindExternalSystemAccountId(BindExternalSystemAccountIdResult)
    case payment(PaymentResult)
    case manageSale(ManageSaleResult)
    case createManageLimitsRequest(CreateManageLimitsRequestResult)
    case manageContractRequest(ManageContractRequestResult)
    case manageContract(ManageContractResult)
    case cancelSaleRequest(CancelSaleCreationRequestResult)
    case createAtomicSwapAskRequest(CreateAtomicSwapAskRequestResult)
    case cancelAtomicSwapAsk(CancelAtomicSwapAskResult)
    case createAtomicSwapBidRequest(CreateAtomicSwapBidRequestResult)
    case manageAccountRole(ManageAccountRoleResult)
    case manageAccountRule(ManageAccountRuleResult)
    case manageSigner(ManageSignerResult)
    case manageSignerRole(ManageSignerRoleResult)
    case manageSignerRule(ManageSignerRuleResult)
    case stamp(StampResult)
    case license(LicenseResult)
    case managePoll(ManagePollResult)
    case manageCreatePollRequest(ManageCreatePollRequestResult)
    case manageVote(ManageVoteResult)
    case manageAccountSpecificRule(ManageAccountSpecificRuleResult)
    case cancelChangeRoleRequest(CancelChangeRoleRequestResult)
    case removeAssetPair(RemoveAssetPairResult)
    case createKycRecoveryRequest(CreateKYCRecoveryRequestResult)
    case initiateKycRecovery(InitiateKYCRecoveryResult)
    case createManageOfferRequest(CreateManageOfferRequestResult)
    case createPaymentRequest(CreatePaymentRequestResult)
    case removeAsset(RemoveAssetResult)
    case openSwap(OpenSwapResult)
    case closeSwap(CloseSwapResult)
    case createRedemptionRequest(CreateRedemptionRequestResult)
    case createData(CreateDataResult)
    case updateData(UpdateDataResult)
    case removeData(RemoveDataResult)
    case createDataCreationRequest(CreateDataCreationRequestResult)
    case cancelDataCreationRequest(CancelDataCreationRequestResult)
    case createDataUpdateRequest(CreateDataUpdateRequestResult)
    case createDataRemoveRequest(CreateDataRemoveRequestResult)
    case cancelDataUpdateRequest(CancelDataUpdateRequestResult)
    case cancelDataRemoveRequest(CancelDataRemoveRequestResult)
    case createDeferredPaymentCreationRequest(CreateDeferredPaymentCreationRequestResult)
    case cancelDeferredPaymentCreationRequest(CancelDeferredPaymentCreationRequestResult)
    case createCloseDeferredPaymentRequest(CreateCloseDeferredPaymentRequestResult)
    case cancelCloseDeferredPaymentRequest(CancelCloseDeferredPaymentRequestResult)
    case lpSwap(LPSwapResult)
    case lpAddLiquidity(LPAddLiquidityResult)
    case lpRemoveLiquidity(LPRemoveLiquidityResult)
    case updateDataOwner(UpdateDataOwnerResult)
    case createDataOwnerUpdateRequest(CreateDataOwnerUpdateRequestResult)
    case cancelDataOwnerUpdateRequest(CancelDataOwnerUpdateRequestResult)

    public var discriminant: Int32 {
      switch self {
      case .createAccount: return OperationType.createAccount.rawValue
      case .createIssuanceRequest: return OperationType.createIssuanceRequest.rawValue
      case .setFees: return OperationType.setFees.rawValue
      case .createWithdrawalRequest: return OperationType.createWithdrawalRequest.rawValue
      case .manageBalance: return OperationType.manageBalance.rawValue
      case .manageAsset: return OperationType.manageAsset.rawValue
      case .createPreissuanceRequest: return OperationType.createPreissuanceRequest.rawValue
      case .manageLimits: return OperationType.manageLimits.rawValue
      case .manageAssetPair: return OperationType.manageAssetPair.rawValue
      case .manageOffer: return OperationType.manageOffer.rawValue
      case .manageInvoiceRequest: return OperationType.manageInvoiceRequest.rawValue
      case .reviewRequest: return OperationType.reviewRequest.rawValue
      case .createSaleRequest: return OperationType.createSaleRequest.rawValue
      case .checkSaleState: return OperationType.checkSaleState.rawValue
      case .payout: return OperationType.payout.rawValue
      case .createAmlAlert: return OperationType.createAmlAlert.rawValue
      case .manageKeyValue: return OperationType.manageKeyValue.rawValue
      case .createChangeRoleRequest: return OperationType.createChangeRoleRequest.rawValue
      case .manageExternalSystemAccountIdPoolEntry: return OperationType.manageExternalSystemAccountIdPoolEntry.rawValue
      case .bindExternalSystemAccountId: return OperationType.bindExternalSystemAccountId.rawValue
      case .payment: return OperationType.payment.rawValue
      case .manageSale: return OperationType.manageSale.rawValue
      case .createManageLimitsRequest: return OperationType.createManageLimitsRequest.rawValue
      case .manageContractRequest: return OperationType.manageContractRequest.rawValue
      case .manageContract: return OperationType.manageContract.rawValue
      case .cancelSaleRequest: return OperationType.cancelSaleRequest.rawValue
      case .createAtomicSwapAskRequest: return OperationType.createAtomicSwapAskRequest.rawValue
      case .cancelAtomicSwapAsk: return OperationType.cancelAtomicSwapAsk.rawValue
      case .createAtomicSwapBidRequest: return OperationType.createAtomicSwapBidRequest.rawValue
      case .manageAccountRole: return OperationType.manageAccountRole.rawValue
      case .manageAccountRule: return OperationType.manageAccountRule.rawValue
      case .manageSigner: return OperationType.manageSigner.rawValue
      case .manageSignerRole: return OperationType.manageSignerRole.rawValue
      case .manageSignerRule: return OperationType.manageSignerRule.rawValue
      case .stamp: return OperationType.stamp.rawValue
      case .license: return OperationType.license.rawValue
      case .managePoll: return OperationType.managePoll.rawValue
      case .manageCreatePollRequest: return OperationType.manageCreatePollRequest.rawValue
      case .manageVote: return OperationType.manageVote.rawValue
      case .manageAccountSpecificRule: return OperationType.manageAccountSpecificRule.rawValue
      case .cancelChangeRoleRequest: return OperationType.cancelChangeRoleRequest.rawValue
      case .removeAssetPair: return OperationType.removeAssetPair.rawValue
      case .createKycRecoveryRequest: return OperationType.createKycRecoveryRequest.rawValue
      case .initiateKycRecovery: return OperationType.initiateKycRecovery.rawValue
      case .createManageOfferRequest: return OperationType.createManageOfferRequest.rawValue
      case .createPaymentRequest: return OperationType.createPaymentRequest.rawValue
      case .removeAsset: return OperationType.removeAsset.rawValue
      case .openSwap: return OperationType.openSwap.rawValue
      case .closeSwap: return OperationType.closeSwap.rawValue
      case .createRedemptionRequest: return OperationType.createRedemptionRequest.rawValue
      case .createData: return OperationType.createData.rawValue
      case .updateData: return OperationType.updateData.rawValue
      case .removeData: return OperationType.removeData.rawValue
      case .createDataCreationRequest: return OperationType.createDataCreationRequest.rawValue
      case .cancelDataCreationRequest: return OperationType.cancelDataCreationRequest.rawValue
      case .createDataUpdateRequest: return OperationType.createDataUpdateRequest.rawValue
      case .createDataRemoveRequest: return OperationType.createDataRemoveRequest.rawValue
      case .cancelDataUpdateRequest: return OperationType.cancelDataUpdateRequest.rawValue
      case .cancelDataRemoveRequest: return OperationType.cancelDataRemoveRequest.rawValue
      case .createDeferredPaymentCreationRequest: return OperationType.createDeferredPaymentCreationRequest.rawValue
      case .cancelDeferredPaymentCreationRequest: return OperationType.cancelDeferredPaymentCreationRequest.rawValue
      case .createCloseDeferredPaymentRequest: return OperationType.createCloseDeferredPaymentRequest.rawValue
      case .cancelCloseDeferredPaymentRequest: return OperationType.cancelCloseDeferredPaymentRequest.rawValue
      case .lpSwap: return OperationType.lpSwap.rawValue
      case .lpAddLiquidity: return OperationType.lpAddLiquidity.rawValue
      case .lpRemoveLiquidity: return OperationType.lpRemoveLiquidity.rawValue
      case .updateDataOwner: return OperationType.updateDataOwner.rawValue
      case .createDataOwnerUpdateRequest: return OperationType.createDataOwnerUpdateRequest.rawValue
      case .cancelDataOwnerUpdateRequest: return OperationType.cancelDataOwnerUpdateRequest.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .createAccount(let data): xdr.append(data.toXDR())
      case .createIssuanceRequest(let data): xdr.append(data.toXDR())
      case .setFees(let data): xdr.append(data.toXDR())
      case .createWithdrawalRequest(let data): xdr.append(data.toXDR())
      case .manageBalance(let data): xdr.append(data.toXDR())
      case .manageAsset(let data): xdr.append(data.toXDR())
      case .createPreissuanceRequest(let data): xdr.append(data.toXDR())
      case .manageLimits(let data): xdr.append(data.toXDR())
      case .manageAssetPair(let data): xdr.append(data.toXDR())
      case .manageOffer(let data): xdr.append(data.toXDR())
      case .manageInvoiceRequest(let data): xdr.append(data.toXDR())
      case .reviewRequest(let data): xdr.append(data.toXDR())
      case .createSaleRequest(let data): xdr.append(data.toXDR())
      case .checkSaleState(let data): xdr.append(data.toXDR())
      case .payout(let data): xdr.append(data.toXDR())
      case .createAmlAlert(let data): xdr.append(data.toXDR())
      case .manageKeyValue(let data): xdr.append(data.toXDR())
      case .createChangeRoleRequest(let data): xdr.append(data.toXDR())
      case .manageExternalSystemAccountIdPoolEntry(let data): xdr.append(data.toXDR())
      case .bindExternalSystemAccountId(let data): xdr.append(data.toXDR())
      case .payment(let data): xdr.append(data.toXDR())
      case .manageSale(let data): xdr.append(data.toXDR())
      case .createManageLimitsRequest(let data): xdr.append(data.toXDR())
      case .manageContractRequest(let data): xdr.append(data.toXDR())
      case .manageContract(let data): xdr.append(data.toXDR())
      case .cancelSaleRequest(let data): xdr.append(data.toXDR())
      case .createAtomicSwapAskRequest(let data): xdr.append(data.toXDR())
      case .cancelAtomicSwapAsk(let data): xdr.append(data.toXDR())
      case .createAtomicSwapBidRequest(let data): xdr.append(data.toXDR())
      case .manageAccountRole(let data): xdr.append(data.toXDR())
      case .manageAccountRule(let data): xdr.append(data.toXDR())
      case .manageSigner(let data): xdr.append(data.toXDR())
      case .manageSignerRole(let data): xdr.append(data.toXDR())
      case .manageSignerRule(let data): xdr.append(data.toXDR())
      case .stamp(let data): xdr.append(data.toXDR())
      case .license(let data): xdr.append(data.toXDR())
      case .managePoll(let data): xdr.append(data.toXDR())
      case .manageCreatePollRequest(let data): xdr.append(data.toXDR())
      case .manageVote(let data): xdr.append(data.toXDR())
      case .manageAccountSpecificRule(let data): xdr.append(data.toXDR())
      case .cancelChangeRoleRequest(let data): xdr.append(data.toXDR())
      case .removeAssetPair(let data): xdr.append(data.toXDR())
      case .createKycRecoveryRequest(let data): xdr.append(data.toXDR())
      case .initiateKycRecovery(let data): xdr.append(data.toXDR())
      case .createManageOfferRequest(let data): xdr.append(data.toXDR())
      case .createPaymentRequest(let data): xdr.append(data.toXDR())
      case .removeAsset(let data): xdr.append(data.toXDR())
      case .openSwap(let data): xdr.append(data.toXDR())
      case .closeSwap(let data): xdr.append(data.toXDR())
      case .createRedemptionRequest(let data): xdr.append(data.toXDR())
      case .createData(let data): xdr.append(data.toXDR())
      case .updateData(let data): xdr.append(data.toXDR())
      case .removeData(let data): xdr.append(data.toXDR())
      case .createDataCreationRequest(let data): xdr.append(data.toXDR())
      case .cancelDataCreationRequest(let data): xdr.append(data.toXDR())
      case .createDataUpdateRequest(let data): xdr.append(data.toXDR())
      case .createDataRemoveRequest(let data): xdr.append(data.toXDR())
      case .cancelDataUpdateRequest(let data): xdr.append(data.toXDR())
      case .cancelDataRemoveRequest(let data): xdr.append(data.toXDR())
      case .createDeferredPaymentCreationRequest(let data): xdr.append(data.toXDR())
      case .cancelDeferredPaymentCreationRequest(let data): xdr.append(data.toXDR())
      case .createCloseDeferredPaymentRequest(let data): xdr.append(data.toXDR())
      case .cancelCloseDeferredPaymentRequest(let data): xdr.append(data.toXDR())
      case .lpSwap(let data): xdr.append(data.toXDR())
      case .lpAddLiquidity(let data): xdr.append(data.toXDR())
      case .lpRemoveLiquidity(let data): xdr.append(data.toXDR())
      case .updateDataOwner(let data): xdr.append(data.toXDR())
      case .createDataOwnerUpdateRequest(let data): xdr.append(data.toXDR())
      case .cancelDataOwnerUpdateRequest(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case OperationType.createAccount.rawValue:
        let data = try CreateAccountResult(xdrData: &xdrData)
        self = .createAccount(data)
      case OperationType.createIssuanceRequest.rawValue:
        let data = try CreateIssuanceRequestResult(xdrData: &xdrData)
        self = .createIssuanceRequest(data)
      case OperationType.setFees.rawValue:
        let data = try SetFeesResult(xdrData: &xdrData)
        self = .setFees(data)
      case OperationType.createWithdrawalRequest.rawValue:
        let data = try CreateWithdrawalRequestResult(xdrData: &xdrData)
        self = .createWithdrawalRequest(data)
      case OperationType.manageBalance.rawValue:
        let data = try ManageBalanceResult(xdrData: &xdrData)
        self = .manageBalance(data)
      case OperationType.manageAsset.rawValue:
        let data = try ManageAssetResult(xdrData: &xdrData)
        self = .manageAsset(data)
      case OperationType.createPreissuanceRequest.rawValue:
        let data = try CreatePreIssuanceRequestResult(xdrData: &xdrData)
        self = .createPreissuanceRequest(data)
      case OperationType.manageLimits.rawValue:
        let data = try ManageLimitsResult(xdrData: &xdrData)
        self = .manageLimits(data)
      case OperationType.manageAssetPair.rawValue:
        let data = try ManageAssetPairResult(xdrData: &xdrData)
        self = .manageAssetPair(data)
      case OperationType.manageOffer.rawValue:
        let data = try ManageOfferResult(xdrData: &xdrData)
        self = .manageOffer(data)
      case OperationType.manageInvoiceRequest.rawValue:
        let data = try ManageInvoiceRequestResult(xdrData: &xdrData)
        self = .manageInvoiceRequest(data)
      case OperationType.reviewRequest.rawValue:
        let data = try ReviewRequestResult(xdrData: &xdrData)
        self = .reviewRequest(data)
      case OperationType.createSaleRequest.rawValue:
        let data = try CreateSaleCreationRequestResult(xdrData: &xdrData)
        self = .createSaleRequest(data)
      case OperationType.checkSaleState.rawValue:
        let data = try CheckSaleStateResult(xdrData: &xdrData)
        self = .checkSaleState(data)
      case OperationType.payout.rawValue:
        let data = try PayoutResult(xdrData: &xdrData)
        self = .payout(data)
      case OperationType.createAmlAlert.rawValue:
        let data = try CreateAMLAlertRequestResult(xdrData: &xdrData)
        self = .createAmlAlert(data)
      case OperationType.manageKeyValue.rawValue:
        let data = try ManageKeyValueResult(xdrData: &xdrData)
        self = .manageKeyValue(data)
      case OperationType.createChangeRoleRequest.rawValue:
        let data = try CreateChangeRoleRequestResult(xdrData: &xdrData)
        self = .createChangeRoleRequest(data)
      case OperationType.manageExternalSystemAccountIdPoolEntry.rawValue:
        let data = try ManageExternalSystemAccountIdPoolEntryResult(xdrData: &xdrData)
        self = .manageExternalSystemAccountIdPoolEntry(data)
      case OperationType.bindExternalSystemAccountId.rawValue:
        let data = try BindExternalSystemAccountIdResult(xdrData: &xdrData)
        self = .bindExternalSystemAccountId(data)
      case OperationType.payment.rawValue:
        let data = try PaymentResult(xdrData: &xdrData)
        self = .payment(data)
      case OperationType.manageSale.rawValue:
        let data = try ManageSaleResult(xdrData: &xdrData)
        self = .manageSale(data)
      case OperationType.createManageLimitsRequest.rawValue:
        let data = try CreateManageLimitsRequestResult(xdrData: &xdrData)
        self = .createManageLimitsRequest(data)
      case OperationType.manageContractRequest.rawValue:
        let data = try ManageContractRequestResult(xdrData: &xdrData)
        self = .manageContractRequest(data)
      case OperationType.manageContract.rawValue:
        let data = try ManageContractResult(xdrData: &xdrData)
        self = .manageContract(data)
      case OperationType.cancelSaleRequest.rawValue:
        let data = try CancelSaleCreationRequestResult(xdrData: &xdrData)
        self = .cancelSaleRequest(data)
      case OperationType.createAtomicSwapAskRequest.rawValue:
        let data = try CreateAtomicSwapAskRequestResult(xdrData: &xdrData)
        self = .createAtomicSwapAskRequest(data)
      case OperationType.cancelAtomicSwapAsk.rawValue:
        let data = try CancelAtomicSwapAskResult(xdrData: &xdrData)
        self = .cancelAtomicSwapAsk(data)
      case OperationType.createAtomicSwapBidRequest.rawValue:
        let data = try CreateAtomicSwapBidRequestResult(xdrData: &xdrData)
        self = .createAtomicSwapBidRequest(data)
      case OperationType.manageAccountRole.rawValue:
        let data = try ManageAccountRoleResult(xdrData: &xdrData)
        self = .manageAccountRole(data)
      case OperationType.manageAccountRule.rawValue:
        let data = try ManageAccountRuleResult(xdrData: &xdrData)
        self = .manageAccountRule(data)
      case OperationType.manageSigner.rawValue:
        let data = try ManageSignerResult(xdrData: &xdrData)
        self = .manageSigner(data)
      case OperationType.manageSignerRole.rawValue:
        let data = try ManageSignerRoleResult(xdrData: &xdrData)
        self = .manageSignerRole(data)
      case OperationType.manageSignerRule.rawValue:
        let data = try ManageSignerRuleResult(xdrData: &xdrData)
        self = .manageSignerRule(data)
      case OperationType.stamp.rawValue:
        let data = try StampResult(xdrData: &xdrData)
        self = .stamp(data)
      case OperationType.license.rawValue:
        let data = try LicenseResult(xdrData: &xdrData)
        self = .license(data)
      case OperationType.managePoll.rawValue:
        let data = try ManagePollResult(xdrData: &xdrData)
        self = .managePoll(data)
      case OperationType.manageCreatePollRequest.rawValue:
        let data = try ManageCreatePollRequestResult(xdrData: &xdrData)
        self = .manageCreatePollRequest(data)
      case OperationType.manageVote.rawValue:
        let data = try ManageVoteResult(xdrData: &xdrData)
        self = .manageVote(data)
      case OperationType.manageAccountSpecificRule.rawValue:
        let data = try ManageAccountSpecificRuleResult(xdrData: &xdrData)
        self = .manageAccountSpecificRule(data)
      case OperationType.cancelChangeRoleRequest.rawValue:
        let data = try CancelChangeRoleRequestResult(xdrData: &xdrData)
        self = .cancelChangeRoleRequest(data)
      case OperationType.removeAssetPair.rawValue:
        let data = try RemoveAssetPairResult(xdrData: &xdrData)
        self = .removeAssetPair(data)
      case OperationType.createKycRecoveryRequest.rawValue:
        let data = try CreateKYCRecoveryRequestResult(xdrData: &xdrData)
        self = .createKycRecoveryRequest(data)
      case OperationType.initiateKycRecovery.rawValue:
        let data = try InitiateKYCRecoveryResult(xdrData: &xdrData)
        self = .initiateKycRecovery(data)
      case OperationType.createManageOfferRequest.rawValue:
        let data = try CreateManageOfferRequestResult(xdrData: &xdrData)
        self = .createManageOfferRequest(data)
      case OperationType.createPaymentRequest.rawValue:
        let data = try CreatePaymentRequestResult(xdrData: &xdrData)
        self = .createPaymentRequest(data)
      case OperationType.removeAsset.rawValue:
        let data = try RemoveAssetResult(xdrData: &xdrData)
        self = .removeAsset(data)
      case OperationType.openSwap.rawValue:
        let data = try OpenSwapResult(xdrData: &xdrData)
        self = .openSwap(data)
      case OperationType.closeSwap.rawValue:
        let data = try CloseSwapResult(xdrData: &xdrData)
        self = .closeSwap(data)
      case OperationType.createRedemptionRequest.rawValue:
        let data = try CreateRedemptionRequestResult(xdrData: &xdrData)
        self = .createRedemptionRequest(data)
      case OperationType.createData.rawValue:
        let data = try CreateDataResult(xdrData: &xdrData)
        self = .createData(data)
      case OperationType.updateData.rawValue:
        let data = try UpdateDataResult(xdrData: &xdrData)
        self = .updateData(data)
      case OperationType.removeData.rawValue:
        let data = try RemoveDataResult(xdrData: &xdrData)
        self = .removeData(data)
      case OperationType.createDataCreationRequest.rawValue:
        let data = try CreateDataCreationRequestResult(xdrData: &xdrData)
        self = .createDataCreationRequest(data)
      case OperationType.cancelDataCreationRequest.rawValue:
        let data = try CancelDataCreationRequestResult(xdrData: &xdrData)
        self = .cancelDataCreationRequest(data)
      case OperationType.createDataUpdateRequest.rawValue:
        let data = try CreateDataUpdateRequestResult(xdrData: &xdrData)
        self = .createDataUpdateRequest(data)
      case OperationType.createDataRemoveRequest.rawValue:
        let data = try CreateDataRemoveRequestResult(xdrData: &xdrData)
        self = .createDataRemoveRequest(data)
      case OperationType.cancelDataUpdateRequest.rawValue:
        let data = try CancelDataUpdateRequestResult(xdrData: &xdrData)
        self = .cancelDataUpdateRequest(data)
      case OperationType.cancelDataRemoveRequest.rawValue:
        let data = try CancelDataRemoveRequestResult(xdrData: &xdrData)
        self = .cancelDataRemoveRequest(data)
      case OperationType.createDeferredPaymentCreationRequest.rawValue:
        let data = try CreateDeferredPaymentCreationRequestResult(xdrData: &xdrData)
        self = .createDeferredPaymentCreationRequest(data)
      case OperationType.cancelDeferredPaymentCreationRequest.rawValue:
        let data = try CancelDeferredPaymentCreationRequestResult(xdrData: &xdrData)
        self = .cancelDeferredPaymentCreationRequest(data)
      case OperationType.createCloseDeferredPaymentRequest.rawValue:
        let data = try CreateCloseDeferredPaymentRequestResult(xdrData: &xdrData)
        self = .createCloseDeferredPaymentRequest(data)
      case OperationType.cancelCloseDeferredPaymentRequest.rawValue:
        let data = try CancelCloseDeferredPaymentRequestResult(xdrData: &xdrData)
        self = .cancelCloseDeferredPaymentRequest(data)
      case OperationType.lpSwap.rawValue:
        let data = try LPSwapResult(xdrData: &xdrData)
        self = .lpSwap(data)
      case OperationType.lpAddLiquidity.rawValue:
        let data = try LPAddLiquidityResult(xdrData: &xdrData)
        self = .lpAddLiquidity(data)
      case OperationType.lpRemoveLiquidity.rawValue:
        let data = try LPRemoveLiquidityResult(xdrData: &xdrData)
        self = .lpRemoveLiquidity(data)
      case OperationType.updateDataOwner.rawValue:
        let data = try UpdateDataOwnerResult(xdrData: &xdrData)
        self = .updateDataOwner(data)
      case OperationType.createDataOwnerUpdateRequest.rawValue:
        let data = try CreateDataOwnerUpdateRequestResult(xdrData: &xdrData)
        self = .createDataOwnerUpdateRequest(data)
      case OperationType.cancelDataOwnerUpdateRequest.rawValue:
        let data = try CancelDataOwnerUpdateRequestResult(xdrData: &xdrData)
        self = .cancelDataOwnerUpdateRequest(data)
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
}
