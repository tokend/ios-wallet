// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum CreateDataUpdateRequestResultCode
//  {
//      SUCCESS = 0,
//      INVALID_VALUE = -1,
//      UPDATE_DATA_TASKS_NOT_FOUND = -2,
//      DATA_NOT_FOUND = -3,
//      INVALID_CREATOR_DETAILS = -4,
//      REQUEST_NOT_FOUND = -5
//  };

//  ===========================================================================
public enum CreateDataUpdateRequestResultCode: Int32, XDREnum {
  case success = 0
  case invalidValue = -1
  case updateDataTasksNotFound = -2
  case dataNotFound = -3
  case invalidCreatorDetails = -4
  case requestNotFound = -5
}