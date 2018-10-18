import XCTest
@testable import TokenDWallet

// swiftlint:disable line_length force_try

class XDRTypesTests: XCTestCase {
    
    private let accountId = "GB5V4R2P6EPS7VDDTWATJKSS3F4FWRIPNRKCWFL6WSYIWBN3L6YH3A3J"
    private let balanceId = "BA7UXH23ZELVU6XZFEXMAE3J4QJTGG3F5ZPOV2BJ335CMGO6BHWRODQG"
    private let counterpartyBalanceId = "BCWR3EV2BW4DD32WYN7G2JNKDHP4KCTR2FCEHFA7ILZIU3MRLPDN7CPD"
    private let assetCode = "OLG"
    private let amount: Int64 = 12345600
    private var pubKey: PublicKey {
        return toXdr(accountId)
    }
    
    private func toXdr(_ encoded: String) -> PublicKey {
        let (_, data) = try! Base32Check.decode(encoded: encoded)
        return PublicKey.keyTypeEd25519(try! Uint256(data))
    }
    
    func testCreateBalanceOp() {
        let manageBalanceOp = ManageBalanceOp(action: ManageBalanceAction.create,
                                              destination: pubKey,
                                              asset: assetCode,
                                              ext: .emptyVersion())
        let op = Operation(sourceAccount: nil, body: Operation.OperationBody.manageBalance(manageBalanceOp))
        
        XCTAssertEqual(op.toXDR().base64, "AAAAAAAAAAkAAAAAAAAAAHteR0/xHy/UY52BNKpS2XhbRQ9sVCsVfrSwiwW7X7B9AAAAA09MRwAAAAAA")
    }
    
    func testDeleteBalanceOp() {
        let manageBalanceOp = ManageBalanceOp(action: ManageBalanceAction.deleteBalance,
                                              destination: pubKey,
                                              asset: assetCode,
                                              ext: .emptyVersion())
        let op = Operation(sourceAccount: nil, body: Operation.OperationBody.manageBalance(manageBalanceOp))
        
        XCTAssertEqual(op.toXDR().base64, "AAAAAAAAAAkAAAABAAAAAHteR0/xHy/UY52BNKpS2XhbRQ9sVCsVfrSwiwW7X7B9AAAAA09MRwAAAAAA")
    }
    
    func testPaymentOp() {
        let feeData = PaymentFeeData(sourceFee: FeeData(paymentFee: amount, fixedFee: amount, ext: FeeData.FeeDataExt.emptyVersion()),
                                     destinationFee: FeeData(paymentFee: amount, fixedFee: amount, ext: FeeData.FeeDataExt.emptyVersion()),
                                     sourcePaysForDest: true,
                                     ext: PaymentFeeData.PaymentFeeDataExt.emptyVersion())
        let paymentOp = PaymentOp(sourceBalanceID: toXdr(balanceId),
                                  destinationBalanceID: toXdr(counterpartyBalanceId),
                                  amount: amount,
                                  feeData: feeData,
                                  subject: "",
                                  reference: "",
                                  invoiceReference: nil,
                                  ext: PaymentOp.PaymentOpExt.emptyVersion())
        let op = Operation(sourceAccount: nil, body: Operation.OperationBody.payment(paymentOp))
        
        XCTAssertEqual(op.toXDR().base64, "AAAAAAAAAAEAAAAAP0ufW8kXWnr5KS7AE2nkEzMbZe5e6ugp3vomGd4J7RcAAAAArR2Sug24Me9Ww35tJaoZ38UKcdFEQ5QfQvKKbZFbxt8AAAAAALxhAAAAAAAAvGEAAAAAAAC8YQAAAAAAAAAAAAC8YQAAAAAAALxhAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAA=")
    }
}

// swiftlint:enable line_length force_try
