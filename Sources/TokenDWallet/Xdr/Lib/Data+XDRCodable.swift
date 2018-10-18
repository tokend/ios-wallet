import Foundation

extension Data: XDRCodable {
    public func toXDR() -> Data {
        var xdr = Int32(self.count).toXDR()
        xdr.append(self)
        
        return xdr
    }
    
    public init(xdrData: inout Data) throws {
        let length = try Int32(xdrData: &xdrData)
        
        if xdrData.count < length {
            throw XDRErrors.decodingError
        }
        
        var data = Data()
        for _ in 0..<length {
            data.append(xdrData.remove(at: 0))
        }
        
        self = data
    }
}
