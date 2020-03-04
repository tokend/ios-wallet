import Foundation

public protocol XDRArrayFixed: XDRCodable, Sequence where Element: XDRCodable {
    static var length: Int { get }
    var wrapped: [Element] { get set }
    
    init()
    init(_ array: [Element]) throws
}

extension XDRArrayFixed {
    public init(_ array: [Element]) throws {
        self.init()
        
        if array.count > Self.length {
            throw XDRErrors.wrongDataLength
        }
        
        self.wrapped = array
    }
    
    public init(xdrData: inout Data) throws {
        self.init()
        for _ in 1...Self.length {
            self.wrapped.append(try Element(xdrData: &xdrData))
        }
    }
    
    public subscript(_ index: Int) -> Element {
        return wrapped[index]
    }
    
    public func makeIterator() -> AnyIterator<Element> {
        var index = 0

        return AnyIterator {
            let element: Element? = index < self.wrapped.count ? self[index] : nil
            index += 1

            return element
        }
    }
    
    public func toXDR() -> Data {
        var xdr = Data()

        forEach {
            xdr.append($0.toXDR())
        }

        return xdr
    }

    public var debugDescription: String {
        return wrapped.debugDescription
    }
}
