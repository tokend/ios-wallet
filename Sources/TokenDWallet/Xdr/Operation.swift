// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: An operation is the lowest unit of work that a transaction does
//  struct Operation
//  {
//      //: sourceAccount is the account used to run the operation
//      //: if not set, the runtime defaults to "sourceAccount" specified at
//      //: the transaction level
//      AccountID* sourceAccount;
//  
//      union switch (OperationType type)
//      {
//      case CREATE_ACCOUNT:
//          CreateAccountOp createAccountOp;
//  	case CREATE_ISSUANCE_REQUEST:
//  		CreateIssuanceRequestOp createIssuanceRequestOp;
//      case SET_FEES:
//          SetFeesOp setFeesOp;
//  	case CREATE_WITHDRAWAL_REQUEST:
//  		CreateWithdrawalRequestOp createWithdrawalRequestOp;
//  	case MANAGE_BALANCE:
//  		ManageBalanceOp manageBalanceOp;
//      case MANAGE_ASSET:
//          ManageAssetOp manageAssetOp;
//      case CREATE_PREISSUANCE_REQUEST:
//          CreatePreIssuanceRequestOp createPreIssuanceRequest;
//      case MANAGE_LIMITS:
//          ManageLimitsOp manageLimitsOp;
//  	case MANAGE_ASSET_PAIR:
//  		ManageAssetPairOp manageAssetPairOp;
//  	case MANAGE_OFFER:
//  		ManageOfferOp manageOfferOp;
//      case MANAGE_INVOICE_REQUEST:
//          ManageInvoiceRequestOp manageInvoiceRequestOp;
//  	case REVIEW_REQUEST:
//  		ReviewRequestOp reviewRequestOp;
//  	case CREATE_SALE_REQUEST:
//  		CreateSaleCreationRequestOp createSaleCreationRequestOp;
//  	case CHECK_SALE_STATE:
//  		CheckSaleStateOp checkSaleStateOp;
//  	case PAYOUT:
//  	    PayoutOp payoutOp;
//  	case CREATE_AML_ALERT:
//  	    CreateAMLAlertRequestOp createAMLAlertRequestOp;
//  	case MANAGE_KEY_VALUE:
//  	    ManageKeyValueOp manageKeyValueOp;
//  	case CREATE_CHANGE_ROLE_REQUEST:
//  		CreateChangeRoleRequestOp createChangeRoleRequestOp;
//      case MANAGE_EXTERNAL_SYSTEM_ACCOUNT_ID_POOL_ENTRY:
//          ManageExternalSystemAccountIdPoolEntryOp manageExternalSystemAccountIdPoolEntryOp;
//      case BIND_EXTERNAL_SYSTEM_ACCOUNT_ID:
//          BindExternalSystemAccountIdOp bindExternalSystemAccountIdOp;
//      case PAYMENT:
//          PaymentOp paymentOp;
//      case MANAGE_SALE:
//          ManageSaleOp manageSaleOp;
//      case CREATE_MANAGE_LIMITS_REQUEST:
//          CreateManageLimitsRequestOp createManageLimitsRequestOp;
//      case MANAGE_CONTRACT_REQUEST:
//          ManageContractRequestOp manageContractRequestOp;
//      case MANAGE_CONTRACT:
//          ManageContractOp manageContractOp;
//      case CANCEL_SALE_REQUEST:
//          CancelSaleCreationRequestOp cancelSaleCreationRequestOp;
//      case CREATE_ATOMIC_SWAP_ASK_REQUEST:
//          CreateAtomicSwapAskRequestOp createAtomicSwapAskRequestOp;
//      case CANCEL_ATOMIC_SWAP_ASK:
//          CancelAtomicSwapAskOp cancelAtomicSwapAskOp;
//      case CREATE_ATOMIC_SWAP_BID_REQUEST:
//          CreateAtomicSwapBidRequestOp createAtomicSwapBidRequestOp;
//      case MANAGE_ACCOUNT_ROLE:
//          ManageAccountRoleOp manageAccountRoleOp;
//      case MANAGE_ACCOUNT_RULE:
//          ManageAccountRuleOp manageAccountRuleOp;
//      case MANAGE_SIGNER:
//          ManageSignerOp manageSignerOp;
//      case MANAGE_SIGNER_ROLE:
//          ManageSignerRoleOp manageSignerRoleOp;
//      case MANAGE_SIGNER_RULE:
//          ManageSignerRuleOp manageSignerRuleOp;
//      case STAMP:
//          StampOp stampOp;
//      case LICENSE:
//          LicenseOp licenseOp;
//      case MANAGE_CREATE_POLL_REQUEST:
//          ManageCreatePollRequestOp manageCreatePollRequestOp;
//      case MANAGE_POLL:
//          ManagePollOp managePollOp;
//      case MANAGE_VOTE:
//          ManageVoteOp manageVoteOp;
//      case MANAGE_ACCOUNT_SPECIFIC_RULE:
//          ManageAccountSpecificRuleOp manageAccountSpecificRuleOp;
//      case CANCEL_CHANGE_ROLE_REQUEST:
//          CancelChangeRoleRequestOp cancelChangeRoleRequestOp;
//      case REMOVE_ASSET_PAIR:
//          RemoveAssetPairOp removeAssetPairOp;
//      case INITIATE_KYC_RECOVERY:
//          InitiateKYCRecoveryOp initiateKYCRecoveryOp;
//      case CREATE_KYC_RECOVERY_REQUEST:
//          CreateKYCRecoveryRequestOp createKYCRecoveryRequestOp;
//      case CREATE_MANAGE_OFFER_REQUEST:
//          CreateManageOfferRequestOp createManageOfferRequestOp;
//      case CREATE_PAYMENT_REQUEST:
//          CreatePaymentRequestOp createPaymentRequestOp;
//      case REMOVE_ASSET:
//          RemoveAssetOp removeAssetOp;
//      case OPEN_SWAP:
//          OpenSwapOp openSwapOp;
//      case CLOSE_SWAP:
//          CloseSwapOp closeSwapOp;
//      case CREATE_REDEMPTION_REQUEST:
//          CreateRedemptionRequestOp createRedemptionRequestOp;
//      case CREATE_DATA:
//          CreateDataOp createDataOp;
//      case UPDATE_DATA:
//          UpdateDataOp updateDataOp;
//      case REMOVE_DATA:
//          RemoveDataOp removeDataOp;
//      case CREATE_DATA_CREATION_REQUEST:
//          CreateDataCreationRequestOp createDataCreationRequestOp;
//      case CANCEL_DATA_CREATION_REQUEST:
//          CancelDataCreationRequestOp cancelDataCreationRequestOp;
//      case CREATE_DATA_UPDATE_REQUEST:
//          CreateDataUpdateRequestOp createDataUpdateRequestOp;
//      case CREATE_DATA_REMOVE_REQUEST:
//          CreateDataRemoveRequestOp createDataRemoveRequestOp;
//      case CANCEL_DATA_UPDATE_REQUEST:
//          CancelDataUpdateRequestOp cancelDataUpdateRequestOp;
//      case CANCEL_DATA_REMOVE_REQUEST:
//          CancelDataRemoveRequestOp cancelDataRemoveRequestOp;
//      case CREATE_DEFERRED_PAYMENT_CREATION_REQUEST:
//          CreateDeferredPaymentCreationRequestOp createDeferredPaymentCreationRequestOp;
//      case CANCEL_DEFERRED_PAYMENT_CREATION_REQUEST:
//          CancelDeferredPaymentCreationRequestOp cancelDeferredPaymentCreationRequestOp;
//      case CREATE_CLOSE_DEFERRED_PAYMENT_REQUEST:
//          CreateCloseDeferredPaymentRequestOp createCloseDeferredPaymentRequestOp;
//      case CANCEL_CLOSE_DEFERRED_PAYMENT_REQUEST:
//          CancelCloseDeferredPaymentRequestOp cancelCloseDeferredPaymentRequestOp;
//      case LP_SWAP:
//          LPSwapOp lpSwapOp;
//      case LP_ADD_LIQUIDITY:
//          LPAddLiquidityOp lpAddLiquidityOp;
//      case LP_REMOVE_LIQUIDITY:
//          LPRemoveLiquidityOp lpRemoveLiquidityOp;
//      case UPDATE_DATA_OWNER:
//          UpdateDataOwnerOp updateDataOwnerOp;
//      case CREATE_DATA_OWNER_UPDATE_REQUEST:
//          CreateDataOwnerUpdateRequestOp createDataOwnerUpdateRequestOp;
//      case CANCEL_DATA_OWNER_UPDATE_REQUEST:
//          CancelDataOwnerUpdateRequestOp cancelDataOwnerUpdateRequestOp;
//      }
//  
//      body;
//  };

//  ===========================================================================
public struct Operation: XDRCodable {
  public var sourceAccount: AccountID?
  public var body: OperationBody

  public init(
      sourceAccount: AccountID?,
      body: OperationBody) {

    self.sourceAccount = sourceAccount
    self.body = body
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.sourceAccount.toXDR())
    xdr.append(self.body.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    if (try Bool(xdrData: &xdrData)) {
      self.sourceAccount = try AccountID(xdrData: &xdrData)
    } else {
      self.sourceAccount = nil
    }
    self.body = try OperationBody(xdrData: &xdrData)
  }

  public enum OperationBody: XDRDiscriminatedUnion {
    case createAccount(CreateAccountOp)
    case createIssuanceRequest(CreateIssuanceRequestOp)
    case setFees(SetFeesOp)
    case createWithdrawalRequest(CreateWithdrawalRequestOp)
    case manageBalance(ManageBalanceOp)
    case manageAsset(ManageAssetOp)
    case createPreissuanceRequest(CreatePreIssuanceRequestOp)
    case manageLimits(ManageLimitsOp)
    case manageAssetPair(ManageAssetPairOp)
    case manageOffer(ManageOfferOp)
    case manageInvoiceRequest(ManageInvoiceRequestOp)
    case reviewRequest(ReviewRequestOp)
    case createSaleRequest(CreateSaleCreationRequestOp)
    case checkSaleState(CheckSaleStateOp)
    case payout(PayoutOp)
    case createAmlAlert(CreateAMLAlertRequestOp)
    case manageKeyValue(ManageKeyValueOp)
    case createChangeRoleRequest(CreateChangeRoleRequestOp)
    case manageExternalSystemAccountIdPoolEntry(ManageExternalSystemAccountIdPoolEntryOp)
    case bindExternalSystemAccountId(BindExternalSystemAccountIdOp)
    case payment(PaymentOp)
    case manageSale(ManageSaleOp)
    case createManageLimitsRequest(CreateManageLimitsRequestOp)
    case manageContractRequest(ManageContractRequestOp)
    case manageContract(ManageContractOp)
    case cancelSaleRequest(CancelSaleCreationRequestOp)
    case createAtomicSwapAskRequest(CreateAtomicSwapAskRequestOp)
    case cancelAtomicSwapAsk(CancelAtomicSwapAskOp)
    case createAtomicSwapBidRequest(CreateAtomicSwapBidRequestOp)
    case manageAccountRole(ManageAccountRoleOp)
    case manageAccountRule(ManageAccountRuleOp)
    case manageSigner(ManageSignerOp)
    case manageSignerRole(ManageSignerRoleOp)
    case manageSignerRule(ManageSignerRuleOp)
    case stamp(StampOp)
    case license(LicenseOp)
    case manageCreatePollRequest(ManageCreatePollRequestOp)
    case managePoll(ManagePollOp)
    case manageVote(ManageVoteOp)
    case manageAccountSpecificRule(ManageAccountSpecificRuleOp)
    case cancelChangeRoleRequest(CancelChangeRoleRequestOp)
    case removeAssetPair(RemoveAssetPairOp)
    case initiateKycRecovery(InitiateKYCRecoveryOp)
    case createKycRecoveryRequest(CreateKYCRecoveryRequestOp)
    case createManageOfferRequest(CreateManageOfferRequestOp)
    case createPaymentRequest(CreatePaymentRequestOp)
    case removeAsset(RemoveAssetOp)
    case openSwap(OpenSwapOp)
    case closeSwap(CloseSwapOp)
    case createRedemptionRequest(CreateRedemptionRequestOp)
    case createData(CreateDataOp)
    case updateData(UpdateDataOp)
    case removeData(RemoveDataOp)
    case createDataCreationRequest(CreateDataCreationRequestOp)
    case cancelDataCreationRequest(CancelDataCreationRequestOp)
    case createDataUpdateRequest(CreateDataUpdateRequestOp)
    case createDataRemoveRequest(CreateDataRemoveRequestOp)
    case cancelDataUpdateRequest(CancelDataUpdateRequestOp)
    case cancelDataRemoveRequest(CancelDataRemoveRequestOp)
    case createDeferredPaymentCreationRequest(CreateDeferredPaymentCreationRequestOp)
    case cancelDeferredPaymentCreationRequest(CancelDeferredPaymentCreationRequestOp)
    case createCloseDeferredPaymentRequest(CreateCloseDeferredPaymentRequestOp)
    case cancelCloseDeferredPaymentRequest(CancelCloseDeferredPaymentRequestOp)
    case lpSwap(LPSwapOp)
    case lpAddLiquidity(LPAddLiquidityOp)
    case lpRemoveLiquidity(LPRemoveLiquidityOp)
    case updateDataOwner(UpdateDataOwnerOp)
    case createDataOwnerUpdateRequest(CreateDataOwnerUpdateRequestOp)
    case cancelDataOwnerUpdateRequest(CancelDataOwnerUpdateRequestOp)

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
      case .manageCreatePollRequest: return OperationType.manageCreatePollRequest.rawValue
      case .managePoll: return OperationType.managePoll.rawValue
      case .manageVote: return OperationType.manageVote.rawValue
      case .manageAccountSpecificRule: return OperationType.manageAccountSpecificRule.rawValue
      case .cancelChangeRoleRequest: return OperationType.cancelChangeRoleRequest.rawValue
      case .removeAssetPair: return OperationType.removeAssetPair.rawValue
      case .initiateKycRecovery: return OperationType.initiateKycRecovery.rawValue
      case .createKycRecoveryRequest: return OperationType.createKycRecoveryRequest.rawValue
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
      case .manageCreatePollRequest(let data): xdr.append(data.toXDR())
      case .managePoll(let data): xdr.append(data.toXDR())
      case .manageVote(let data): xdr.append(data.toXDR())
      case .manageAccountSpecificRule(let data): xdr.append(data.toXDR())
      case .cancelChangeRoleRequest(let data): xdr.append(data.toXDR())
      case .removeAssetPair(let data): xdr.append(data.toXDR())
      case .initiateKycRecovery(let data): xdr.append(data.toXDR())
      case .createKycRecoveryRequest(let data): xdr.append(data.toXDR())
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
        let data = try CreateAccountOp(xdrData: &xdrData)
        self = .createAccount(data)
      case OperationType.createIssuanceRequest.rawValue:
        let data = try CreateIssuanceRequestOp(xdrData: &xdrData)
        self = .createIssuanceRequest(data)
      case OperationType.setFees.rawValue:
        let data = try SetFeesOp(xdrData: &xdrData)
        self = .setFees(data)
      case OperationType.createWithdrawalRequest.rawValue:
        let data = try CreateWithdrawalRequestOp(xdrData: &xdrData)
        self = .createWithdrawalRequest(data)
      case OperationType.manageBalance.rawValue:
        let data = try ManageBalanceOp(xdrData: &xdrData)
        self = .manageBalance(data)
      case OperationType.manageAsset.rawValue:
        let data = try ManageAssetOp(xdrData: &xdrData)
        self = .manageAsset(data)
      case OperationType.createPreissuanceRequest.rawValue:
        let data = try CreatePreIssuanceRequestOp(xdrData: &xdrData)
        self = .createPreissuanceRequest(data)
      case OperationType.manageLimits.rawValue:
        let data = try ManageLimitsOp(xdrData: &xdrData)
        self = .manageLimits(data)
      case OperationType.manageAssetPair.rawValue:
        let data = try ManageAssetPairOp(xdrData: &xdrData)
        self = .manageAssetPair(data)
      case OperationType.manageOffer.rawValue:
        let data = try ManageOfferOp(xdrData: &xdrData)
        self = .manageOffer(data)
      case OperationType.manageInvoiceRequest.rawValue:
        let data = try ManageInvoiceRequestOp(xdrData: &xdrData)
        self = .manageInvoiceRequest(data)
      case OperationType.reviewRequest.rawValue:
        let data = try ReviewRequestOp(xdrData: &xdrData)
        self = .reviewRequest(data)
      case OperationType.createSaleRequest.rawValue:
        let data = try CreateSaleCreationRequestOp(xdrData: &xdrData)
        self = .createSaleRequest(data)
      case OperationType.checkSaleState.rawValue:
        let data = try CheckSaleStateOp(xdrData: &xdrData)
        self = .checkSaleState(data)
      case OperationType.payout.rawValue:
        let data = try PayoutOp(xdrData: &xdrData)
        self = .payout(data)
      case OperationType.createAmlAlert.rawValue:
        let data = try CreateAMLAlertRequestOp(xdrData: &xdrData)
        self = .createAmlAlert(data)
      case OperationType.manageKeyValue.rawValue:
        let data = try ManageKeyValueOp(xdrData: &xdrData)
        self = .manageKeyValue(data)
      case OperationType.createChangeRoleRequest.rawValue:
        let data = try CreateChangeRoleRequestOp(xdrData: &xdrData)
        self = .createChangeRoleRequest(data)
      case OperationType.manageExternalSystemAccountIdPoolEntry.rawValue:
        let data = try ManageExternalSystemAccountIdPoolEntryOp(xdrData: &xdrData)
        self = .manageExternalSystemAccountIdPoolEntry(data)
      case OperationType.bindExternalSystemAccountId.rawValue:
        let data = try BindExternalSystemAccountIdOp(xdrData: &xdrData)
        self = .bindExternalSystemAccountId(data)
      case OperationType.payment.rawValue:
        let data = try PaymentOp(xdrData: &xdrData)
        self = .payment(data)
      case OperationType.manageSale.rawValue:
        let data = try ManageSaleOp(xdrData: &xdrData)
        self = .manageSale(data)
      case OperationType.createManageLimitsRequest.rawValue:
        let data = try CreateManageLimitsRequestOp(xdrData: &xdrData)
        self = .createManageLimitsRequest(data)
      case OperationType.manageContractRequest.rawValue:
        let data = try ManageContractRequestOp(xdrData: &xdrData)
        self = .manageContractRequest(data)
      case OperationType.manageContract.rawValue:
        let data = try ManageContractOp(xdrData: &xdrData)
        self = .manageContract(data)
      case OperationType.cancelSaleRequest.rawValue:
        let data = try CancelSaleCreationRequestOp(xdrData: &xdrData)
        self = .cancelSaleRequest(data)
      case OperationType.createAtomicSwapAskRequest.rawValue:
        let data = try CreateAtomicSwapAskRequestOp(xdrData: &xdrData)
        self = .createAtomicSwapAskRequest(data)
      case OperationType.cancelAtomicSwapAsk.rawValue:
        let data = try CancelAtomicSwapAskOp(xdrData: &xdrData)
        self = .cancelAtomicSwapAsk(data)
      case OperationType.createAtomicSwapBidRequest.rawValue:
        let data = try CreateAtomicSwapBidRequestOp(xdrData: &xdrData)
        self = .createAtomicSwapBidRequest(data)
      case OperationType.manageAccountRole.rawValue:
        let data = try ManageAccountRoleOp(xdrData: &xdrData)
        self = .manageAccountRole(data)
      case OperationType.manageAccountRule.rawValue:
        let data = try ManageAccountRuleOp(xdrData: &xdrData)
        self = .manageAccountRule(data)
      case OperationType.manageSigner.rawValue:
        let data = try ManageSignerOp(xdrData: &xdrData)
        self = .manageSigner(data)
      case OperationType.manageSignerRole.rawValue:
        let data = try ManageSignerRoleOp(xdrData: &xdrData)
        self = .manageSignerRole(data)
      case OperationType.manageSignerRule.rawValue:
        let data = try ManageSignerRuleOp(xdrData: &xdrData)
        self = .manageSignerRule(data)
      case OperationType.stamp.rawValue:
        let data = try StampOp(xdrData: &xdrData)
        self = .stamp(data)
      case OperationType.license.rawValue:
        let data = try LicenseOp(xdrData: &xdrData)
        self = .license(data)
      case OperationType.manageCreatePollRequest.rawValue:
        let data = try ManageCreatePollRequestOp(xdrData: &xdrData)
        self = .manageCreatePollRequest(data)
      case OperationType.managePoll.rawValue:
        let data = try ManagePollOp(xdrData: &xdrData)
        self = .managePoll(data)
      case OperationType.manageVote.rawValue:
        let data = try ManageVoteOp(xdrData: &xdrData)
        self = .manageVote(data)
      case OperationType.manageAccountSpecificRule.rawValue:
        let data = try ManageAccountSpecificRuleOp(xdrData: &xdrData)
        self = .manageAccountSpecificRule(data)
      case OperationType.cancelChangeRoleRequest.rawValue:
        let data = try CancelChangeRoleRequestOp(xdrData: &xdrData)
        self = .cancelChangeRoleRequest(data)
      case OperationType.removeAssetPair.rawValue:
        let data = try RemoveAssetPairOp(xdrData: &xdrData)
        self = .removeAssetPair(data)
      case OperationType.initiateKycRecovery.rawValue:
        let data = try InitiateKYCRecoveryOp(xdrData: &xdrData)
        self = .initiateKycRecovery(data)
      case OperationType.createKycRecoveryRequest.rawValue:
        let data = try CreateKYCRecoveryRequestOp(xdrData: &xdrData)
        self = .createKycRecoveryRequest(data)
      case OperationType.createManageOfferRequest.rawValue:
        let data = try CreateManageOfferRequestOp(xdrData: &xdrData)
        self = .createManageOfferRequest(data)
      case OperationType.createPaymentRequest.rawValue:
        let data = try CreatePaymentRequestOp(xdrData: &xdrData)
        self = .createPaymentRequest(data)
      case OperationType.removeAsset.rawValue:
        let data = try RemoveAssetOp(xdrData: &xdrData)
        self = .removeAsset(data)
      case OperationType.openSwap.rawValue:
        let data = try OpenSwapOp(xdrData: &xdrData)
        self = .openSwap(data)
      case OperationType.closeSwap.rawValue:
        let data = try CloseSwapOp(xdrData: &xdrData)
        self = .closeSwap(data)
      case OperationType.createRedemptionRequest.rawValue:
        let data = try CreateRedemptionRequestOp(xdrData: &xdrData)
        self = .createRedemptionRequest(data)
      case OperationType.createData.rawValue:
        let data = try CreateDataOp(xdrData: &xdrData)
        self = .createData(data)
      case OperationType.updateData.rawValue:
        let data = try UpdateDataOp(xdrData: &xdrData)
        self = .updateData(data)
      case OperationType.removeData.rawValue:
        let data = try RemoveDataOp(xdrData: &xdrData)
        self = .removeData(data)
      case OperationType.createDataCreationRequest.rawValue:
        let data = try CreateDataCreationRequestOp(xdrData: &xdrData)
        self = .createDataCreationRequest(data)
      case OperationType.cancelDataCreationRequest.rawValue:
        let data = try CancelDataCreationRequestOp(xdrData: &xdrData)
        self = .cancelDataCreationRequest(data)
      case OperationType.createDataUpdateRequest.rawValue:
        let data = try CreateDataUpdateRequestOp(xdrData: &xdrData)
        self = .createDataUpdateRequest(data)
      case OperationType.createDataRemoveRequest.rawValue:
        let data = try CreateDataRemoveRequestOp(xdrData: &xdrData)
        self = .createDataRemoveRequest(data)
      case OperationType.cancelDataUpdateRequest.rawValue:
        let data = try CancelDataUpdateRequestOp(xdrData: &xdrData)
        self = .cancelDataUpdateRequest(data)
      case OperationType.cancelDataRemoveRequest.rawValue:
        let data = try CancelDataRemoveRequestOp(xdrData: &xdrData)
        self = .cancelDataRemoveRequest(data)
      case OperationType.createDeferredPaymentCreationRequest.rawValue:
        let data = try CreateDeferredPaymentCreationRequestOp(xdrData: &xdrData)
        self = .createDeferredPaymentCreationRequest(data)
      case OperationType.cancelDeferredPaymentCreationRequest.rawValue:
        let data = try CancelDeferredPaymentCreationRequestOp(xdrData: &xdrData)
        self = .cancelDeferredPaymentCreationRequest(data)
      case OperationType.createCloseDeferredPaymentRequest.rawValue:
        let data = try CreateCloseDeferredPaymentRequestOp(xdrData: &xdrData)
        self = .createCloseDeferredPaymentRequest(data)
      case OperationType.cancelCloseDeferredPaymentRequest.rawValue:
        let data = try CancelCloseDeferredPaymentRequestOp(xdrData: &xdrData)
        self = .cancelCloseDeferredPaymentRequest(data)
      case OperationType.lpSwap.rawValue:
        let data = try LPSwapOp(xdrData: &xdrData)
        self = .lpSwap(data)
      case OperationType.lpAddLiquidity.rawValue:
        let data = try LPAddLiquidityOp(xdrData: &xdrData)
        self = .lpAddLiquidity(data)
      case OperationType.lpRemoveLiquidity.rawValue:
        let data = try LPRemoveLiquidityOp(xdrData: &xdrData)
        self = .lpRemoveLiquidity(data)
      case OperationType.updateDataOwner.rawValue:
        let data = try UpdateDataOwnerOp(xdrData: &xdrData)
        self = .updateDataOwner(data)
      case OperationType.createDataOwnerUpdateRequest.rawValue:
        let data = try CreateDataOwnerUpdateRequestOp(xdrData: &xdrData)
        self = .createDataOwnerUpdateRequest(data)
      case OperationType.cancelDataOwnerUpdateRequest.rawValue:
        let data = try CancelDataOwnerUpdateRequestOp(xdrData: &xdrData)
        self = .cancelDataOwnerUpdateRequest(data)
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
}
