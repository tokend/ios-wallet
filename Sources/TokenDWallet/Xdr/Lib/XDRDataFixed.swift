import Foundation

public protocol XDRDataFixed: XDRCodable, Equatable {
    static var length: Int { get }
    
    var wrapped: Data { get set }
    
    init()
    init(_ data: Data) throws
}

extension XDRDataFixed {
    public func toXDR() -> Data {
        return self.wrapped
    }
    
    public init(xdrData: inout Data) throws {
        self.init()
        
        if xdrData.count < Self.length {
            throw XDRErrors.decodingError
        }
        
        var data = Data()
        for _ in 0..<Self.length {
            data.append(xdrData.remove(at: 0))
        }
        
        self.wrapped = data
    }
    
    public init(_ data: Data) throws {
        self.init()
        
        if data.count > Self.length {
            throw XDRErrors.wrongDataLength
        }
        
        self.wrapped = data
        
        // Add zeros to remain data size same
        if data.count < Self.length {
            self.wrapped.append(Data(count: Self.length - data.count))
        }
    }
    
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.wrapped == rhs.wrapped
    }
}
