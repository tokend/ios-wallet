// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Actions that can be applied to a signer
//  enum ManageSignerAction
//  {
//      CREATE = 0,
//      UPDATE = 1,
//      REMOVE = 2
//  };

//  ===========================================================================
public enum ManageSignerAction: Int32, XDREnum {
  case create = 0
  case update = 1
  case remove = 2
}
