import Foundation

public protocol XDREnum: RawRepresentable, XDRCodable, CaseIterable { }

extension XDREnum where RawValue: XDRCodable {
    public func toXDR() -> Data {
        return self.rawValue.toXDR()
    }
    
    public init(xdrData: inout Data) throws {
        self.init(rawValue: try RawValue(xdrData: &xdrData))!
    }
}
