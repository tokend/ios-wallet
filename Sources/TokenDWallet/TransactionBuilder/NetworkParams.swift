import Foundation
import DLCryptoKit

public struct NetworkParams {
    
    // MARK: - Public properties
    
    let passphrase: String
    let networkId: Data
    
    // MARK: -
    
    public init?(passphrase: String) {
        self.passphrase = passphrase
        
        guard let passphraseData = self.passphrase.data(using: .utf8) else {
            return nil
        }
        
        self.networkId = Common.SHA.sha256(data: passphraseData)
    }
}
