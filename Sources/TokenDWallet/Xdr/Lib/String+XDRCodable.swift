import Foundation

extension String: XDRCodable {
    public func toXDR() -> Data {
        let length = Int32(self.lengthOfBytes(using: .utf8))
        
        var xdr = length.toXDR()
        xdr.append(self.data(using: .utf8)!)
        
        let extraBytes = length % 4
        if extraBytes > 0 {
            for _ in 0..<(4 - extraBytes) {
                xdr.append(contentsOf: [0])
            }
        }
        
        return xdr
    }
    
    public init(xdrData: inout Data) throws {
        let length = try Int32(xdrData: &xdrData)
        
        if xdrData.count < length {
            throw XDRErrors.decodingError
        }
        
        let data = xdrData.subdata(in: 0..<Int(length))
        
        guard let value = String(bytes: data, encoding: .utf8) else {
            throw XDRErrors.decodingError
        }
        self = value
        
        let mod = length % 4
        let extraBytes = mod == 0 ? 0 : 4 - mod
        
        (0..<(length + extraBytes)).forEach { _ in xdrData.remove(at: 0) }
    }
}
