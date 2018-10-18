import XCTest
@testable import TokenDWallet
import DLCryptoKit

class TransactionModelTests: XCTestCase {
    
    // swiftlint:disable line_length identifier_name
    
    let SOURCE_ACCOUNT_ID: String = "GDVJSBSBSERR3YP3LKLHTODWEFGCSLDWDIODER3CKLZXUMVPZOPT4MHY"
    let NETWORK: NetworkParams = NetworkParams(passphrase: "Example Test Network")!
    
    func testSignedTransactionEnvelop() {
        let sourceBalance = "BBVRUASMC2OMFGWHQPD4TTXTZZ7ACOFWWFTB5Y3K6757FSUSAEPEPXAS"
        let sourceAccountSeed = "SBEBZQIXHAZ3BZXOJEN6R57KMEDISGBIIP6LAVRCNDM4WZIQPHNYZICC"
        let destBalance = "BCN65IW4JYFLLJADTA5PNP2N27KPGDWUBD27UAHQITRTO3ADVST4WI3O"
        
        guard let decodedSeed = try? Base32Check.decodeCheck(expectedVersion: .seedEd25519, encoded: sourceAccountSeed) else {
            XCTAssert(false, "Failed to decode seed")
            return
        }
        guard let keyData = try? ECDSA.KeyData(seed: decodedSeed) else {
            XCTAssert(false, "Failed to init key pair")
            return
        }
        
        guard
            let sourceBalanceId = try? PublicKeyFactory.fromBalanceId(sourceBalance),
            let destBalanceId = try? PublicKeyFactory.fromBalanceId(destBalance)
            else {
                XCTAssert(false, "Failed to decode balance ids")
                return
        }
        
        let paymentOp = PaymentOp(
            sourceBalanceID: sourceBalanceId,
            destinationBalanceID: destBalanceId,
            amount: 1000000,
            feeData: PaymentFeeData(
                sourceFee: FeeData(paymentFee: 0, fixedFee: 0, ext: FeeData.FeeDataExt.emptyVersion()),
                destinationFee: FeeData(paymentFee: 0, fixedFee: 0, ext: FeeData.FeeDataExt.emptyVersion()),
                sourcePaysForDest: false,
                ext: PaymentFeeData.PaymentFeeDataExt.emptyVersion()
            ),
            subject: "Test",
            reference: "",
            invoiceReference: nil,
            ext: PaymentOp.PaymentOpExt.emptyVersion()
        )
        
        guard
            let accountId = try? PublicKeyFactory.fromAccountId(self.SOURCE_ACCOUNT_ID)
            else {
                XCTAssert(false, "Failed to decode account id")
                return
        }
        
        let operations: [TokenDWallet.Operation] = [
            TokenDWallet.Operation(
                sourceAccount: nil,
                body: Operation.OperationBody.payment(paymentOp)
            )
        ]
        
        let transaction: TransactionModel
        do {
            transaction = try TransactionModel(
                networkParams: self.NETWORK,
                sourceAccountId: accountId,
                memo: Memo.memoText("Sample text"),
                operations: operations,
                timeBounds: TimeBounds(minTime: 0, maxTime: 42),
                salt: 0
            )
        } catch let error {
            XCTAssert(false, "Failed to init transaction: \(error.localizedDescription)")
            return
        }
        
        do {
            try transaction.addSignature(signer: keyData)
        } catch let error {
            XCTAssert(false, "Failed to add signature: \(error.localizedDescription)")
            return
        }
        
        let expectedEnvelope = "AAAAAOqZBkGRIx3h+1qWebh2IUwpLHYaHDJHYlLzejKvy58+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAqAAAAAQAAAAtTYW1wbGUgdGV4dAAAAAABAAAAAAAAAAEAAAAAaxoCTBacwprHg8fJzvPOfgE4trFmHuNq9/vyypIBHkcAAAAAm+6i3E4KtaQDmDr2v03X1PMO1Aj1+gDwROM3bAOsp8sAAAAAAA9CQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAARUZXN0AAAAAAAAAAAAAAAAAAAAAAAAAAHjQTipAAAAQGslKbormeLjf75qgaaJlvVbTAM2cXgObU7pd3MWnfw+eJ4BmIJwGZxsMXBm7kY0xe1FTszUIYGs31T5MpmA2AE="
        
        let envelope = transaction.getEnvelope().toXdrBase64String()
        XCTAssert(expectedEnvelope == envelope, "Transaction envelop doesn't match")
    }
    
    func testNoOperations() {
        guard
            let accountId = try? PublicKeyFactory.fromAccountId(self.SOURCE_ACCOUNT_ID)
            else {
                XCTAssert(false, "Failed to decode account id")
                return
        }
        
        do {
            _ = try TransactionModel(
                networkParams: self.NETWORK,
                sourceAccountId: accountId,
                memo: Memo.memoText("Sample text"),
                operations: [],
                timeBounds: TimeBounds(minTime: 0, maxTime: 42),
                salt: 0
            )
            XCTAssert(false, "Empty transaction can't be init")
        } catch {
            XCTAssert(true)
        }
    }
    
    // swiftlint:enable line_length identifier_name
}
