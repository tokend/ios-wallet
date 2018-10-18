import Foundation

public enum PublicKeyFactory {
    
    public static func fromBalanceId(_ balanceIdBase32CheckEncoded: String) throws -> BalanceID {
        return try self.keyTypeEd25519From(
            base32CheckEncoded: balanceIdBase32CheckEncoded,
            versionByte: .balanceIdEd25519
        )
    }
    
    public static func fromAccountId(_ accountIdBase32CheckEncoded: String) throws -> AccountID {
        return try self.keyTypeEd25519From(
            base32CheckEncoded: accountIdBase32CheckEncoded,
            versionByte: .accountIdEd25519
        )
    }
    
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
