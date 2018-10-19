import Foundation

/// Provides functionality that allows to build transactions
public class TransactionBuilder {
    
    // MARK: - Public properties
    
    public let networkParams: NetworkParams
    public let sourceAccountId: AccountID
    public let params: TransactionBuilderParams
    
    // MARK: - Private properties
    
    private var operations: [Operation] = []
    
    // MARK: -
    
    public init(
        networkParams: NetworkParams,
        sourceAccountId: AccountID,
        params: TransactionBuilderParams
        ) {
        
        self.networkParams = networkParams
        self.sourceAccountId = sourceAccountId
        self.params = params
    }
    
    // MARK: - Public
    
    /// Method adds operations to transaction
    /// - Parameters:
    ///     - operationBody: Operation that should be added
    ///     - operationSourceAccount: Identifier of account from which operation is sended
    public func add(
        operationBody: Operation.OperationBody,
        operationSourceAccount: AccountID? = nil
        ) {
        
        let operation = Operation(
            sourceAccount: operationSourceAccount,
            body: operationBody
        )
        self.operations.append(operation)
    }
    
    /// Method builds transaction
    /// - Returns: `TransactionModel`
    public func buildTransaction() throws -> TransactionModel {
        return try TransactionModel(
            networkParams: self.networkParams,
            sourceAccountId: self.sourceAccountId,
            memo: self.params.memo,
            operations: self.operations,
            timeBounds: self.params.timeBounds,
            salt: self.params.salt
        )
    }
}
