import XCTest
@testable import TokenDWallet
import DLCryptoKit

class ECDSASignDecoratedTests: XCTestCase {
    
    // swiftlint:disable line_length
    
    let seed: String = "SBUFJEEK7FMWXPE4HGOWQZPHZ4V5TFKGSF664RAGT24NS662MKTQ7J6S"
    let expectedSig: String = "W3R2wwAAAEAbDruuYYsmdmioEi7MzSogSAvIGVHrQB4PkrYTSDt5h2PTautLBAS8KjH6Hq1HUiu6CHBatRuiBQIOZ9Ca6H0O"
    let data: Data = "TokenD is awesome".data(using: .utf8)!
    
    func testDecoratedSignature() {
        guard let decodedSeed = try? Base32Check.decodeCheck(expectedVersion: .seedEd25519, encoded: self.seed) else {
            XCTAssert(false, "Failed to decode seed")
            return
        }
        guard let keyData = try? ECDSA.KeyData(seed: decodedSeed) else {
            XCTAssert(false, "Failed to init key pair")
            return
        }
        
        do {
            let signature = try ECDSA.signED25519Decorated(data: self.data, keyData: keyData)
            let encodedSignature = signature.toXdrBase64String()
            
            XCTAssert(encodedSignature == self.expectedSig, "Decorated signatures not equal")
        } catch let error {
            XCTAssert(false, "Failed to sign decorated: \(error.localizedDescription)")
        }
    }
    
    // swiftlint:enable line_length
}
