// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum CreateDataCreationRequestResultCode
//  {
//      SUCCESS = 0,
//      INVALID_VALUE = -1,
//      CREATE_DATA_TASKS_NOT_FOUND = -2,
//      REQUEST_NOT_FOUND = -3,
//      INVALID_CREATOR_DETAILS = -4
//  };

//  ===========================================================================
public enum CreateDataCreationRequestResultCode: Int32, XDREnum {
  case success = 0
  case invalidValue = -1
  case createDataTasksNotFound = -2
  case requestNotFound = -3
  case invalidCreatorDetails = -4
}