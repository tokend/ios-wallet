import Foundation

public struct XDRArrayFixed<T: XDREncodable>: Sequence {
    public private(set) var list: [T]
    
    public init(_ array: [T]) {
        self.list = array
    }
    
    public subscript(_ index: Int) -> T {
        return list[index]
    }
    
    public func makeIterator() -> AnyIterator<T> {
        var index = 0
        
        return AnyIterator {
            let element: T? = index < self.list.count ? self[index] : nil
            index += 1
            
            return element
        }
    }
}

extension XDRArrayFixed: XDREncodable, CustomDebugStringConvertible {
    public func toXDR() -> Data {
        var xdr = Data()
        
        forEach {
            xdr.append($0.toXDR())
        }
        
        return xdr
    }
    
    public var debugDescription: String {
        return list.debugDescription
    }
}
