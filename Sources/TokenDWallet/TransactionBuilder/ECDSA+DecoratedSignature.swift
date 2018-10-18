import Foundation
import DLCryptoKit

extension ECDSA {
    
    public static func signED25519Decorated(data: Data, keyData: ECDSA.KeyData) throws -> DecoratedSignature {
        let signature = try ECDSA.signED25519(data: data, keyData: keyData)
        
        let hint = self.getSignatureHint(keyData: keyData)
        
        let decoratedSignature = DecoratedSignature(
            hint: hint,
            signature: signature
        )
        
        return decoratedSignature
    }
    
    public static func getSignatureHint(keyData: ECDSA.KeyData) -> SignatureHint {
        let publicKey = keyData.getPublicKeyData()
        let hintData = publicKey[publicKey.count - SignatureHint.length ..< publicKey.count]
        
        var hint = SignatureHint()
        hint.wrapped = hintData
        
        return hint
    }
}
