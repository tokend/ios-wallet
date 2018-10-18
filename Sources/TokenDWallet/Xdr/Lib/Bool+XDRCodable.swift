import Foundation

extension Bool: XDRCodable {
    public func toXDR() -> Data {
        return Int32(self ? 1 : 0).toXDR()
    }

    public init(xdrData: inout Data) throws {
        let b = try Int32(xdrData: &xdrData)
        self = b != 0
    }
}
