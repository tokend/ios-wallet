// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  enum ManageAssetAction
//  {
//      CREATE_ASSET_CREATION_REQUEST = 0,
//      CREATE_ASSET_UPDATE_REQUEST = 1,
//      CANCEL_ASSET_REQUEST = 2,
//      CHANGE_PREISSUED_ASSET_SIGNER = 3,
//      UPDATE_MAX_ISSUANCE = 4
//  };

//  ===========================================================================
public enum ManageAssetAction: Int32, XDREnum {
  case createAssetCreationRequest = 0
  case createAssetUpdateRequest = 1
  case cancelAssetRequest = 2
  case changePreissuedAssetSigner = 3
  case updateMaxIssuance = 4
}
