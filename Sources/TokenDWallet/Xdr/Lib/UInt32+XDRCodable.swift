import Foundation

extension UInt32: XDRCodable {
    public func toXDR() -> Data {
        var n = self
        var a = [UInt8]()
        
        let divisor = UInt32(UInt8.max) + 1
        for _ in 0..<(self.bitWidth / UInt8.bitWidth) {
            a.append(UInt8(n % divisor))
            n /= divisor
        }
        
        return Data(bytes: a.reversed())
    }
    
    public init(xdrData: inout Data) throws {
        var n: UInt32 = 0
        
        let count = UInt32.bitWidth / UInt8.bitWidth
        
        if xdrData.count < count {
            throw XDRErrors.decodingError
        }
        
        xdrData.withUnsafeBytes { (bp: UnsafePointer<UInt8>) -> Void in
            for index in 0..<count {
                n *= 256
                n += UInt32(bp.advanced(by: index).pointee)
            }
        }
        
        (0..<count).forEach { _ in xdrData.remove(at: 0) }
        
        self = n
    }
}
