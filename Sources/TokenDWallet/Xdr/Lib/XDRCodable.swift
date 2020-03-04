import Foundation

public protocol XDREncodable {
    func toXDR() -> Data
    
    func toXdrBase64String() -> String
}

extension XDREncodable {
    public func toXdrBase64String() -> String {
        return self.toXDR().base64EncodedString()
    }
}

public protocol XDRDecodable {
    init(xdrData: inout Data) throws
    init(xdrBase64: String) throws
}

extension XDRDecodable {
    public init(xdrBase64: String) throws {
        guard var data = Data(base64Encoded: xdrBase64) else {
            throw XDRErrors.base64DecodeError
        }
        try self.init(xdrData: &data)
    }
}

public typealias XDRCodable = XDREncodable & XDRDecodable
