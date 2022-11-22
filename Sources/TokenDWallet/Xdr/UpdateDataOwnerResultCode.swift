// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum UpdateDataOwnerResultCode
//  {
//      //: An owner of the data was successfully updated
//      SUCCESS = 0,
//      //: Entry with provided ID does not exist
//      NOT_FOUND = -1,
//      //: Only owner can update data entry
//      NOT_AUTHORIZED = -2,
//      //: A user does not exist
//      USER_NOT_FOUND = -3,
//      //: A user who changes a owner of data cannot changes it to himself
//      OLD_AND_NEW_USERS_ARE_SAME = -4
//  };

//  ===========================================================================
public enum UpdateDataOwnerResultCode: Int32, XDREnum {
  case success = 0
  case notFound = -1
  case notAuthorized = -2
  case userNotFound = -3
  case oldAndNewUsersAreSame = -4
}