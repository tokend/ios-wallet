import Foundation

/// Provides functionality which allow to transform public keys
/// from `String` format to `PublicKey`
public enum PublicKeyFactory {
    
    /// Method transforms balance id from `String` format to `BalanceID`
    /// - Returns: `BalanceID`
    public static func fromBalanceId(_ balanceIdBase32CheckEncoded: String) throws -> BalanceID {
        return try self.keyTypeEd25519From(
            base32CheckEncoded: balanceIdBase32CheckEncoded,
            versionByte: .balanceIdEd25519
        )
    }
    
    /// Method transforms balance id from `String` format to `AccountID`
    /// - Returns: `AccountID`
    public static func fromAccountId(_ accountIdBase32CheckEncoded: String) throws -> AccountID {
        return try self.keyTypeEd25519From(
            base32CheckEncoded: accountIdBase32CheckEncoded,
            versionByte: .accountIdEd25519
        )
    }
    /// Method transforms public key from `String` format to `PublicKey`
    /// - Returns: `PublicKey`
    /// - Parameters:
    ///     - base32CheckEncoded: Base32Check encoded key
    ///     - versionByte: Version byte which is used to determine encoded data type
    public static func keyTypeEd25519From(
        base32CheckEncoded: String,
        versionByte: Base32Check.VersionByte
        ) throws -> PublicKey {
        
        let decoded = try Base32Check.decodeCheck(
            expectedVersion: versionByte,
            encoded: base32CheckEncoded
        )
        
        var uint256Value = Uint256()
        uint256Value.wrapped = decoded
        
        return PublicKey.keyTypeEd25519(uint256Value)
    }
}
