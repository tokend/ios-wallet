// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  //: ManageAccountRoleOp is used to create, update or remove account role
//  struct ManageAccountRoleOp
//  {
//      //: data is used to pass one of `ManageAccountRoleAction` with required params
//      union switch (ManageAccountRoleAction action)
//      {
//      case CREATE:
//          CreateAccountRoleData createData;
//      case UPDATE:
//          UpdateAccountRoleData updateData;
//      case REMOVE:
//          RemoveAccountRoleData removeData;
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
public struct ManageAccountRoleOp: XDRCodable {
  public var data: ManageAccountRoleOpData
  public var ext: ManageAccountRoleOpExt

  public init(
      data: ManageAccountRoleOpData,
      ext: ManageAccountRoleOpExt) {

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
    self.data = try ManageAccountRoleOpData(xdrData: &xdrData)
    self.ext = try ManageAccountRoleOpExt(xdrData: &xdrData)
  }

  public enum ManageAccountRoleOpData: XDRDiscriminatedUnion {
    case create(CreateAccountRoleData)
    case update(UpdateAccountRoleData)
    case remove(RemoveAccountRoleData)

    public var discriminant: Int32 {
      switch self {
      case .create: return ManageAccountRoleAction.create.rawValue
      case .update: return ManageAccountRoleAction.update.rawValue
      case .remove: return ManageAccountRoleAction.remove.rawValue
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
      case ManageAccountRoleAction.create.rawValue:
        let data = try CreateAccountRoleData(xdrData: &xdrData)
        self = .create(data)
      case ManageAccountRoleAction.update.rawValue:
        let data = try UpdateAccountRoleData(xdrData: &xdrData)
        self = .update(data)
      case ManageAccountRoleAction.remove.rawValue:
        let data = try RemoveAccountRoleData(xdrData: &xdrData)
        self = .remove(data)
      default:
        throw XDRErrors.unknownEnumCase
      }
    }

  }
  public enum ManageAccountRoleOpExt: XDRDiscriminatedUnion {
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
