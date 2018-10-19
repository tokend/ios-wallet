import Foundation
import DLCryptoKit

extension ECDSA {
    
    /// Method signes given data and return decorated signature
    /// - Parameters:
    ///     - data: Data to be signed
    ///     - keyData: Key which is used to sign
    /// - Returns: `DecoratedSignature`
    public static func signED25519Decorated(data: Data, keyData: ECDSA.KeyData) throws -> DecoratedSignature {
        let signature = try ECDSA.signED25519(data: data, keyData: keyData)
        
        let hint = self.getSignatureHint(keyData: keyData)
        
        let decoratedSignature = DecoratedSignature(
            hint: hint,
            signature: signature
        )
        
        return decoratedSignature
    }
    
    /// Method returns last 4 bytes of the public key in model of `SignatureHint`
    /// - Returns: `SignatureHint`
    /// - Parameters:
    ///     - keyData: Key pair that contains public key, which is used as a source of hint
    public static func getSignatureHint(keyData: ECDSA.KeyData) -> SignatureHint {
        let publicKey = keyData.getPublicKeyData()
        let hintData = publicKey[publicKey.count - SignatureHint.length ..< publicKey.count]
        
        var hint = SignatureHint()
        hint.wrapped = hintData
        
        return hint
    }
}
