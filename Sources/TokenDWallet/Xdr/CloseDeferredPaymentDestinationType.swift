// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Defines the type of destination of the payment
//  enum CloseDeferredPaymentDestinationType {
//      ACCOUNT = 0,
//      BALANCE = 1
//  };

//  ===========================================================================
public enum CloseDeferredPaymentDestinationType: Int32, XDREnum {
  case account = 0
  case balance = 1
}