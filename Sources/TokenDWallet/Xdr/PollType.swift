// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Functional type of poll
//  enum PollType
//  {
//      SINGLE_CHOICE = 0,
//      CUSTOM_CHOICE = 1
//  };

//  ===========================================================================
public enum PollType: Int32, XDREnum {
  case singleChoice = 0
  case customChoice = 1
}
