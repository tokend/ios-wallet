import XCTest
@testable import TokenDWallet

// swiftlint:disable identifier_name

class XDREncodingTests: XCTestCase {
    
    func testBasicTypes() {
        // Int
        XCTAssertEqual(Int32(5).toXDR().base64, "AAAABQ==")
        XCTAssertEqual(UInt32(5).toXDR().base64, "AAAABQ==")
        XCTAssertEqual(UInt64(5).toXDR().base64, "AAAAAAAAAAU=")
        XCTAssertEqual(Int64(5).toXDR().base64, "AAAAAAAAAAU=")
        
        // Float, Double and Quadruple is unsupported
        
        // Bool
        XCTAssertEqual(true.toXDR().base64, "AAAAAQ==")
    }
    
    func testEnum() {
        enum TestEnum: Int32, XDREnum {
            case a = 0
            case b = 1
            case c = -1
        }
        
        XCTAssertEqual(TestEnum.a.toXDR().base64, "AAAAAA==")
        XCTAssertEqual(TestEnum.b.toXDR().base64, "AAAAAQ==")
        XCTAssertEqual(TestEnum.c.toXDR().base64, "/////w==")
    }
    
    func testOptional() {
        var test: Int32?
        XCTAssertEqual(test.toXDR().base64, "AAAAAA==")
        test = 5
        XCTAssertEqual(test.toXDR().base64, "AAAAAQAAAAU=")
    }
    
    func testString() {
        XCTAssertEqual("test".toXDR().base64, "AAAABHRlc3Q=")
    }
    
    func testOpaque() {
        // Dinamic size
        let data = Data(bytes: [1])
        XCTAssertEqual(data.toXDR().base64, "AAAAAQE=")
        // Fixed size
        struct XDRDataFixed1: XDRDataFixed {
            static var length: Int { return 1 }
            
            var wrapped: Data
            
            init() {
                self.wrapped = Data()
            }
        }
        XCTAssertEqual(try? XDRDataFixed1(data).toXDR().base64, "AQ==")
    }
    
    func testArray() {
        // Dinamic size
        let data = [Int64(1)]
        XCTAssertEqual(data.toXDR().base64, "AAAAAQAAAAAAAAAB")
        struct XDRArrayFixed1<WrappedElement: XDRCodable>: XDRArrayFixed {
            typealias Element = WrappedElement
            
            static var length: Int { return 1 }
            
            var wrapped: [WrappedElement]
            
            init() {
                self.wrapped = [WrappedElement]()
            }
        }
        // Fixed size
        XCTAssertEqual(try XDRArrayFixed1(data).toXDR().base64, "AAAAAAAAAAE=")
    }
    
    func testDescriminatedUnion() {
        enum TestDescriminatedUnion: XDRDiscriminatedUnion {
            case a(Int64)
            case b(Int32)
            case c
            
            var discriminant: Int32 {
                switch self {
                case .a: return 0
                case .b: return 1
                case .c: return 2
                }
            }
            
            func toXDR() -> Data {
                var xdr = Data()
                
                xdr.append(self.discriminant.toXDR())
                
                switch self {
                case .a(let data): xdr.append(data.toXDR())
                case .b(let data): xdr.append(data.toXDR())
                case .c: xdr.append(Data())
                }
                
                return xdr
            }
            
            init(xdrData: inout Data) throws {
                let discriminant = try Int32(xdrData: &xdrData)
                
                switch discriminant {
                case 0:
                    let data = try Int64(xdrData: &xdrData)
                    self = .a(data)
                case 1:
                    let data = try Int32(xdrData: &xdrData)
                    self = .b(data)
                case 2:
                    self = .c
                default:
                    throw XDRErrors.unknownEnumCase
                }
            }
        }
        
        XCTAssertEqual(TestDescriminatedUnion.a(1).toXDR().base64, "AAAAAAAAAAAAAAAB")
        XCTAssertEqual(TestDescriminatedUnion.b(1).toXDR().base64, "AAAAAQAAAAE=")
        XCTAssertEqual(TestDescriminatedUnion.c.toXDR().base64, "AAAAAg==")
    }
    
    func testStruct() {
        enum TestEnum: Int32, XDREnum {
            case a = 0
            case b = 1
            case c = -1
        }
        struct Test: XDREncodable {
            var a: Int32
            var b: Int32?
            var c: Bool
            var d: TestEnum
            
            func toXDR() -> Data {
                var xdr = Data()
                
                xdr.append(self.a.toXDR())
                xdr.append(self.b.toXDR())
                xdr.append(self.c.toXDR())
                xdr.append(self.d.toXDR())
                
                return xdr
            }
        }
        
        let test = Test(a: 1, b: nil, c: true, d: TestEnum.a)
        
        XCTAssertEqual(test.toXDR().base64, "AAAAAQAAAAAAAAABAAAAAA==")
    }
}

// swiftlint:enable identifier_name
