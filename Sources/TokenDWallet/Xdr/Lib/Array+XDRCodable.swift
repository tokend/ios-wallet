import Foundation

extension Array: XDREncodable {
    public func toXDR() -> Data {
        let length = UInt32(self.count)
        
        var xdr = length.toXDR()
        
        forEach {
            if let encodable = $0 as? XDREncodable {
                xdr.append(encodable.toXDR())
            }
        }
        
        return xdr
    }
}
