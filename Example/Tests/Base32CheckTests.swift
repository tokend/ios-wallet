import XCTest
@testable import TokenDWallet

class Base32CheckTest: XCTestCase {
    
    let seed = "SDJHRQF4GCMIIKAAAQ6IHY42X73FQFLHUULAPSKKD4DFDM7UXWWCRHBE"
    let accountId = "GDJHRQF4GCMIIKAAAQ6IHY42X73FQFLHUULAPSKKD4DFDM7UXWWCQDS3"
    let balanceId = "BDJHRQF4GCMIIKAAAQ6IHY42X73FQFLHUULAPSKKD4DFDM7UXWWCQMUQ"
    let data = Data(base64Encoded: "0njAvDCYhCgABDyD45q/9lgVZ6UWB8lKHwZRs/S9rCg=")!
    
    func testSeed() {
        XCTAssertEqual(try? Base32Check.decodeCheck(expectedVersion: .seedEd25519, encoded: seed), data)
        XCTAssertEqual(Base32Check.encode(version: .seedEd25519, data: data), seed)
    }
    
    func testAccountId() {
        XCTAssertEqual(try? Base32Check.decodeCheck(expectedVersion: .accountIdEd25519, encoded: accountId), data)
        XCTAssertEqual(Base32Check.encode(version: .accountIdEd25519, data: data), accountId)
    }
    
    func testBalanceId() {
        XCTAssertEqual(try? Base32Check.decodeCheck(expectedVersion: .balanceIdEd25519, encoded: balanceId), data)
        XCTAssertEqual(Base32Check.encode(version: .balanceIdEd25519, data: data), balanceId)
    }
    
    func testValidation() {
        XCTAssert(Base32Check.isValid(expectedVersion: .balanceIdEd25519, encoded: balanceId))
        // Wrong version
        XCTAssertFalse(Base32Check.isValid(expectedVersion: .balanceIdEd25519, encoded: seed))
        // Wrong checksum
        XCTAssertFalse(Base32Check.isValid(
            expectedVersion: .balanceIdEd25519,
            encoded: "BDJHRQF4GCMIIKAAAQ6IHY42X73FQFLHUTLAPSKKD4DFDM7UXWWCQMUQ")
        )
    }
}
