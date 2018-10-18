import Foundation

public struct TransactionBuilderParams {
    public let memo: TokenDWallet.Memo?
    public let timeBounds: TokenDWallet.TimeBounds
    public let salt: TokenDWallet.Salt?
    
    public init(
        memo: TokenDWallet.Memo?,
        timeBounds: TokenDWallet.TimeBounds,
        salt: TokenDWallet.Salt?
        ) {
        
        self.memo = memo
        self.timeBounds = timeBounds
        self.salt = salt
    }
}
