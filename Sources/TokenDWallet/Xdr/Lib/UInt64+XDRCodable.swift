import Foundation

extension UInt64: XDRCodable {
    public func toXDR() -> Data {
        var n = self
        var array = [UInt8]()
        
        let divisor = UInt64(UInt8.max) + 1
        for _ in 0..<(self.bitWidth / UInt8.bitWidth) {
            array.append(UInt8(n % divisor))
            n /= divisor
        }
        
        return Data(bytes: array.reversed())
    }
    
    public init(xdrData: inout Data) throws {
        var n: UInt64 = 0
        
        let count = UInt64.bitWidth / UInt8.bitWidth
        
        if xdrData.count < count {
            throw XDRErrors.decodingError
        }
        
        xdrData.withUnsafeBytes { (bp: UnsafePointer<UInt8>) -> Void in
            for index in 0..<count {
                n *= 256
                n += UInt64(bp.advanced(by: index).pointee)
            }
        }
        
        (0..<count).forEach { _ in xdrData.remove(at: 0) }
        
        self = n
    }
}
