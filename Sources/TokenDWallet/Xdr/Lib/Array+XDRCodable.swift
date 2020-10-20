import Foundation

extension Array: XDRCodable where Element: XDRCodable {
    public func toXDR() -> Data {
        let length = UInt32(self.count)
        
        var xdr = length.toXDR()
        
        forEach {
            xdr.append($0.toXDR())
        }
        
        return xdr
    }

    public init(xdrData: inout Data) throws {
        let length = try Int32(xdrData: &xdrData)
        var result: [Element] = []
        for _ in 1...length {
            result.append(try Element(xdrData: &xdrData))
        }
        self = result
    }
}
