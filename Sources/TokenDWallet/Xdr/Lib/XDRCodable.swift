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
}

public typealias XDRCodable = XDREncodable & XDRDecodable
