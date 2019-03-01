import Foundation
import DLCryptoKit

/// Struct contains data which is used to identify network
public struct NetworkParams {
    
    // MARK: - Public properties
    
    public let passphrase: String
    public let networkId: Data
    
    // MARK: -
    
    public init?(passphrase: String) {
        self.passphrase = passphrase
        
        guard let passphraseData = self.passphrase.data(using: .utf8) else {
            return nil
        }
        
        self.networkId = Common.SHA.sha256(data: passphraseData)
    }
}
