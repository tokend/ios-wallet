// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Actions that can be applied to a vote entry
//  enum ManageVoteAction
//  {
//      CREATE = 0,
//      REMOVE = 1
//  };

//  ===========================================================================
public enum ManageVoteAction: Int32, XDREnum {
  case create = 0
  case remove = 1
}