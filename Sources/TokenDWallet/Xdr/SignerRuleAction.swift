// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Actions that can be applied to a signer rule resource
//  enum SignerRuleAction
//  {
//      ANY = 1,
//      CREATE = 2,
//      CREATE_FOR_OTHER = 3,
//      UPDATE = 4,
//      MANAGE = 5,
//      SEND = 6,
//      REMOVE = 7,
//      CANCEL = 8,
//      REVIEW = 9,
//      RECEIVE_ATOMIC_SWAP = 10,
//      PARTICIPATE = 11,
//      BIND = 12,
//      UPDATE_MAX_ISSUANCE = 13,
//      CHECK = 14,
//      CLOSE = 15,
//      UPDATE_END_TIME = 16,
//      CREATE_WITH_TASKS = 17,
//      CREATE_FOR_OTHER_WITH_TASKS = 18,
//      REMOVE_FOR_OTHER = 19,
//      EXCHANGE = 20,
//      UPDATE_FOR_OTHER = 21,
//      CUSTOM = 22,
//      TRANSFER_OWNERSHIP = 23,
//      LP_ADD_LIQUIDITY = 24,
//      LP_REMOVE_LIQUIDITY = 25,
//      LP_SWAP = 26
//  };

//  ===========================================================================
public enum SignerRuleAction: Int32, XDREnum {
  case any = 1
  case create = 2
  case createForOther = 3
  case update = 4
  case manage = 5
  case send = 6
  case remove = 7
  case cancel = 8
  case review = 9
  case receiveAtomicSwap = 10
  case participate = 11
  case bind = 12
  case updateMaxIssuance = 13
  case check = 14
  case close = 15
  case updateEndTime = 16
  case createWithTasks = 17
  case createForOtherWithTasks = 18
  case removeForOther = 19
  case exchange = 20
  case updateForOther = 21
  case custom = 22
  case transferOwnership = 23
  case lpAddLiquidity = 24
  case lpRemoveLiquidity = 25
  case lpSwap = 26
}
