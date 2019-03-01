// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum CreateAccountResultCode
//  {
//      //: Means that `destination` account was successfully created with signers specified in `signersData`
//      SUCCESS = 0,
//  
//      // codes considered as "failure" for the operation
//      //: Source account cannot be the same as the destination account
//      INVALID_DESTINATION = -1,
//      //: Account with such ID already exists
//      ALREADY_EXISTS = -2, // account already exist
//      //: Sum of weights of signers with different identities must exceed the threshold (for now 1000)
//      INVALID_WEIGHT = -3,
//      //: There is no role with such id
//      NO_SUCH_ROLE = -4,
//      //: Failed to create signer for account because `signersData` is invalid.
//      //: See `createSignerErrorCode`
//      INVALID_SIGNER_DATA = -5,
//      //: Not allowed to create account without signers
//      NO_SIGNER_DATA = -6 // empty signer data array not allowed
//  };

//  ===========================================================================
public enum CreateAccountResultCode: Int32, XDREnum {
  case success = 0
  case invalidDestination = -1
  case alreadyExists = -2
  case invalidWeight = -3
  case noSuchRole = -4
  case invalidSignerData = -5
  case noSignerData = -6
}
