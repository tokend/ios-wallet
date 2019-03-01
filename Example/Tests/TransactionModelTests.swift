import XCTest
@testable import TokenDWallet
import DLCryptoKit

class TransactionModelTests: XCTestCase {
    
    // swiftlint:disable identifier_name
    
    let SOURCE_ACCOUNT_ID: String = "GDVJSBSBSERR3YP3LKLHTODWEFGCSLDWDIODER3CKLZXUMVPZOPT4MHY"
    let NETWORK: NetworkParams = NetworkParams(passphrase: "Example Test Network")!
    
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
    
    // swiftlint:enable identifier_name
}
