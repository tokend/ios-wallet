// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: ManageSignerRuleOp is used to create, update or remove signer rule
//  struct ManageSignerRuleOp
//  {
//      //: data is used to pass one of `ManageSignerRuleAction` with required params
//      union switch (ManageSignerRuleAction action)
//      {
//      case CREATE:
//          CreateSignerRuleData createData;
//      case UPDATE:
//          UpdateSignerRuleData updateData;
//      case REMOVE:
//          RemoveSignerRuleData removeData;
//      } data;
//  
//      //: reserved for future use
//      union switch (LedgerVersion v)
//      {
//      case EMPTY_VERSION:
//          void;
//      }
//      ext;
//  };

//  ===========================================================================
public struct ManageSignerRuleOp: XDRCodable {
  public var data: ManageSignerRuleOpData
  public var ext: ManageSignerRuleOpExt

  public init(
      data: ManageSignerRuleOpData,
      ext: ManageSignerRuleOpExt) {

    self.data = data
    self.ext = ext
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.data.toXDR())
    xdr.append(self.ext.toXDR())

    return xdr
  }

  public init(xdrData: inout Data) throws {
    self.data = try ManageSignerRuleOpData(xdrData: &xdrData)
    self.ext = try ManageSignerRuleOpExt(xdrData: &xdrData)
  }

  public enum ManageSignerRuleOpData: XDRDiscriminatedUnion {
    case create(CreateSignerRuleData)
    case update(UpdateSignerRuleData)
    case remove(RemoveSignerRuleData)

    public var discriminant: Int32 {
      switch self {
      case .create: return ManageSignerRuleAction.create.rawValue
      case .update: return ManageSignerRuleAction.update.rawValue
      case .remove: return ManageSignerRuleAction.remove.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .create(let data): xdr.append(data.toXDR())
      case .update(let data): xdr.append(data.toXDR())
      case .remove(let data): xdr.append(data.toXDR())
      }

      return xdr
    }

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case ManageSignerRuleAction.create.rawValue:
        let data = try CreateSignerRuleData(xdrData: &xdrData)
        self = .create(data)
      case ManageSignerRuleAction.update.rawValue:
        let data = try UpdateSignerRuleData(xdrData: &xdrData)
        self = .update(data)
      case ManageSignerRuleAction.remove.rawValue:
        let data = try RemoveSignerRuleData(xdrData: &xdrData)
        self = .remove(data)
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
  public enum ManageSignerRuleOpExt: XDRDiscriminatedUnion {
    case emptyVersion

    public var discriminant: Int32 {
      switch self {
      case .emptyVersion: return LedgerVersion.emptyVersion.rawValue
      }
    }

    public func toXDR() -> Data {
      var xdr = Data()

      xdr.append(self.discriminant.toXDR())

      switch self {
      case .emptyVersion: xdr.append(Data())
      }

      return xdr
    }

    public init(xdrData: inout Data) throws {
      let discriminant = try Int32(xdrData: &xdrData)

      switch discriminant {
      case LedgerVersion.emptyVersion.rawValue: self = .emptyVersion
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
}
