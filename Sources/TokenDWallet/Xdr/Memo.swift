// Automatically generated by xdrgen
// DO NOT EDIT or your changes may be overwritten

import Foundation

// === xdr source ============================================================

//  union Memo switch (MemoType type)
//  {
//  case MEMO_NONE:
//      void;
//  case MEMO_TEXT:
//      string text<28>;
//  case MEMO_ID:
//      uint64 id;
//  case MEMO_HASH:
//      Hash hash; // the hash of what to pull from the content server
//  case MEMO_RETURN:
//      Hash retHash; // the hash of the tx you are rejecting
//  };

//  ===========================================================================
public enum Memo: XDRDiscriminatedUnion {
  case memoNone()
  case memoText(String)
  case memoId(Uint64)
  case memoHash(Hash)
  case memoReturn(Hash)

  public var discriminant: Int32 {
    switch self {
    case .memoNone: return MemoType.memoNone.rawValue
    case .memoText: return MemoType.memoText.rawValue
    case .memoId: return MemoType.memoId.rawValue
    case .memoHash: return MemoType.memoHash.rawValue
    case .memoReturn: return MemoType.memoReturn.rawValue
    }
  }

  public func toXDR() -> Data {
    var xdr = Data()

    xdr.append(self.discriminant.toXDR())

    switch self {
    case .memoNone(): xdr.append(Data())
    case .memoText(let data): xdr.append(data.toXDR())
    case .memoId(let data): xdr.append(data.toXDR())
    case .memoHash(let data): xdr.append(data.toXDR())
    case .memoReturn(let data): xdr.append(data.toXDR())
    }

    return xdr
  }

  public init(xdrData: inout Data) throws {
    let discriminant = try Int32(xdrData: &xdrData)

    switch discriminant {
    case MemoType.memoNone.rawValue: self = .memoNone()
    case MemoType.memoText.rawValue:
      let data = try String(xdrData: &xdrData)
      self = .memoText(data)
    case MemoType.memoId.rawValue:
      let data = try Uint64(xdrData: &xdrData)
      self = .memoId(data)
    case MemoType.memoHash.rawValue:
      let data = try Hash(xdrData: &xdrData)
      self = .memoHash(data)
    case MemoType.memoReturn.rawValue:
      let data = try Hash(xdrData: &xdrData)
      self = .memoReturn(data)
    default:
      throw XDRErrors.unknownEnumCase
    }
  }
}
