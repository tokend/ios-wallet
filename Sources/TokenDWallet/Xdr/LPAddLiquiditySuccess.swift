// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  struct LPAddLiquiditySuccess
//      {
//          //: Unique identifier of the liquidity pool
//          uint64 liquidityPoolID;
//  
//          //: ID of the pool account
//          AccountID poolAccount;
//  
//          //: ID of the first asset balance in LP
//          BalanceID lpFirstAssetBalanceID;
//          //: ID of the second asset balance in LP
//          BalanceID lpSecondAssetBalanceID;
//  
//          //: ID of the source first asset balance
//          BalanceID sourceFirstAssetBalanceID;
//          //: ID of the source second asset balance
//          BalanceID sourceSecondAssetBalanceID;
//  
//          //: Amount of tokens charged from source first balance
//          uint64 firstAssetAmount;
//          //: Amount of tokens charged from source second balance
//          uint64 secondAssetAmount;
//          
//          //: ID of the LP tokens asset balance 
//          BalanceID lpTokensBalanceID;
//          //: Amount of LP tokens issued for provided liquidity
//          uint64 lpTokensAmount;
//          
//          //: Reserved for future extension
//          EmptyExt ext;
//      };

//  ===========================================================================
public struct LPAddLiquiditySuccess: XDRCodable {
  public var liquidityPoolID: Uint64
  public var poolAccount: AccountID
  public var lpFirstAssetBalanceID: BalanceID
  public var lpSecondAssetBalanceID: BalanceID
  public var sourceFirstAssetBalanceID: BalanceID
  public var sourceSecondAssetBalanceID: BalanceID
  public var firstAssetAmount: Uint64
  public var secondAssetAmount: Uint64
  public var lpTokensBalanceID: BalanceID
  public var lpTokensAmount: Uint64
  public var ext: EmptyExt

  public init(
      liquidityPoolID: Uint64,
      poolAccount: AccountID,
      lpFirstAssetBalanceID: BalanceID,
      lpSecondAssetBalanceID: BalanceID,
      sourceFirstAssetBalanceID: BalanceID,
      sourceSecondAssetBalanceID: BalanceID,
      firstAssetAmount: Uint64,
      secondAssetAmount: Uint64,
      lpTokensBalanceID: BalanceID,
      lpTokensAmount: Uint64,
      ext: EmptyExt) {

    self.liquidityPoolID = liquidityPoolID
    self.poolAccount = poolAccount
    self.lpFirstAssetBalanceID = lpFirstAssetBalanceID
    self.lpSecondAssetBalanceID = lpSecondAssetBalanceID
    self.sourceFirstAssetBalanceID = sourceFirstAssetBalanceID
    self.sourceSecondAssetBalanceID = sourceSecondAssetBalanceID
    self.firstAssetAmount = firstAssetAmount
    self.secondAssetAmount = secondAssetAmount
    self.lpTokensBalanceID = lpTokensBalanceID
    self.lpTokensAmount = lpTokensAmount
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.liquidityPoolID.toXDR())
    xdr.append(self.poolAccount.toXDR())
    xdr.append(self.lpFirstAssetBalanceID.toXDR())
    xdr.append(self.lpSecondAssetBalanceID.toXDR())
    xdr.append(self.sourceFirstAssetBalanceID.toXDR())
    xdr.append(self.sourceSecondAssetBalanceID.toXDR())
    xdr.append(self.firstAssetAmount.toXDR())
    xdr.append(self.secondAssetAmount.toXDR())
    xdr.append(self.lpTokensBalanceID.toXDR())
    xdr.append(self.lpTokensAmount.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.liquidityPoolID = try Uint64(xdrData: &xdrData)
    self.poolAccount = try AccountID(xdrData: &xdrData)
    self.lpFirstAssetBalanceID = try BalanceID(xdrData: &xdrData)
    self.lpSecondAssetBalanceID = try BalanceID(xdrData: &xdrData)
    self.sourceFirstAssetBalanceID = try BalanceID(xdrData: &xdrData)
    self.sourceSecondAssetBalanceID = try BalanceID(xdrData: &xdrData)
    self.firstAssetAmount = try Uint64(xdrData: &xdrData)
    self.secondAssetAmount = try Uint64(xdrData: &xdrData)
    self.lpTokensBalanceID = try BalanceID(xdrData: &xdrData)
    self.lpTokensAmount = try Uint64(xdrData: &xdrData)
    self.ext = try EmptyExt(xdrData: &xdrData)
  }
}
