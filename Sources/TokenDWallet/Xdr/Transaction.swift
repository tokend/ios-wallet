// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Transaction is a container for a set of operations
//  //:    - is executed by an account
//  //:    - operations are executed in order as one ACID transaction
//  //: (either all operations are applied or none are if any returns a failing code)
//  struct Transaction
//  {
//      //: account used to run the transaction
//      AccountID sourceAccount;
//  
//      //: random number used to ensure there is no hash collisions
//      Salt salt;
//  
//      //: validity range (inclusive) for the last ledger close time
//      TimeBounds timeBounds;
//  
//      //: allows to attach additional data to the transactions
//      Memo memo;
//  
//      //: list of operations to be applied. Max size is 100
//      Operation operations<100>;
//  
//      // reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct Transaction: XDRCodable {
  public var sourceAccount: AccountID
  public var salt: Salt
  public var timeBounds: TimeBounds
  public var memo: Memo
  public var operations: [Operation]
  public var ext: TransactionExt

  public init(
      sourceAccount: AccountID,
      salt: Salt,
      timeBounds: TimeBounds,
      memo: Memo,
      operations: [Operation],
      ext: TransactionExt) {

    self.sourceAccount = sourceAccount
    self.salt = salt
    self.timeBounds = timeBounds
    self.memo = memo
    self.operations = operations
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.sourceAccount.toXDR())
    xdr.append(self.salt.toXDR())
    xdr.append(self.timeBounds.toXDR())
    xdr.append(self.memo.toXDR())
    xdr.append(self.operations.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.sourceAccount = try AccountID(xdrData: &xdrData)
    self.salt = try Salt(xdrData: &xdrData)
    self.timeBounds = try TimeBounds(xdrData: &xdrData)
    self.memo = try Memo(xdrData: &xdrData)
    let lengthoperations = try Int32(xdrData: &xdrData)
    self.operations = [Operation]()
    for _ in 1...lengthoperations {
      self.operations.append(try Operation(xdrData: &xdrData))
    }
    self.ext = try TransactionExt(xdrData: &xdrData)
  }

  public enum TransactionExt: XDRDiscriminatedUnion {
    case emptyVersion()

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion(): xdr.append(Data())
      }

      return xdr
    }

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case LedgerVersion.emptyVersion.rawValue: self = .emptyVersion()
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
}
