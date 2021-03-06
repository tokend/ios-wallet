// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: Result code of ManageVoteOp
//  enum ManageVoteResultCode
//  {
//      // codes considered as "success" for the operation
//      //: Specified action in `data` of ManageVoteOp was successfully executed
//      SUCCESS = 0,
//  
//      // codes considered as "failure" for the operation
//      //: There is no vote from source account in such poll
//      VOTE_NOT_FOUND = -1, // vote to remove  not found
//      //: There is no poll with such id
//      POLL_NOT_FOUND = -2, // poll not found
//      //: Not allowed to create (send) two votes for one poll
//      VOTE_EXISTS = -3,
//      //: Not allowed to create (send) vote with functional type that is different from the poll functional type
//      POLL_TYPE_MISMATCHED = -4,
//      //: Not allowed to vote in poll which not started yet
//      POLL_NOT_STARTED = -5,
//      //: Not allowed to vote in poll which already was ended
//      POLL_ENDED = -6
//  };

//  ===========================================================================
public enum ManageVoteResultCode: Int32, XDREnum {
  case success = 0
  case voteNotFound = -1
  case pollNotFound = -2
  case voteExists = -3
  case pollTypeMismatched = -4
  case pollNotStarted = -5
  case pollEnded = -6
}
