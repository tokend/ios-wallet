import XCTest
@testable import TokenDWallet

// swiftlint:disable identifier_name

class XDRDecodingTests: XCTestCase {
    
    func testBasicTypes() {
        // Int
        XCTAssertEqual(try Int32(xdrBase64: "AAAABQ=="), Int32(5))
        XCTAssertEqual(try UInt32(xdrBase64: "AAAABQ=="), UInt32(5))
        XCTAssertEqual(try UInt64(xdrBase64: "AAAAAAAAAAU="), UInt64(5))
        XCTAssertEqual(try Int64(xdrBase64: "AAAAAAAAAAU="), Int64(5))

        // Float, Double and Quadruple is unsupported

        // Bool
        XCTAssertEqual(try Bool(xdrBase64: "AAAAAQ=="), true)
    }
    
    func testEnum() {
        enum TestEnum: Int32, XDREnum {
            case a = 0
            case b = 1
            case c = -1
        }

        XCTAssertEqual(try TestEnum(xdrBase64: "AAAAAA=="), TestEnum.a)
        XCTAssertEqual(try TestEnum(xdrBase64: "AAAAAQ=="), TestEnum.b)
        XCTAssertEqual(try TestEnum(xdrBase64: "/////w=="), TestEnum.c)
    }

    func testOptional() {
        var test: Int32?
        XCTAssertEqual(decodeOptionalInt32(xdrBase64: "AAAAAA=="), test)
        test = 5
        XCTAssertEqual(decodeOptionalInt32(xdrBase64: "AAAAAQAAAAU="), test)
    }
    
    private func decodeOptionalInt32(xdrBase64: String) -> Int32? {
        var data = Data(base64Encoded: xdrBase64)!
        if (try? Bool(xdrData: &data)) == true {
            return try? Int32(xdrData: &data)
        } else {
            return nil
        }
    }

    func testString() {
        XCTAssertEqual(try String(xdrBase64: "AAAABHRlc3Q="), "test")
    }

    func testOpaque() {
        // Dinamic size
        let data = Data(bytes: [1])
        XCTAssertEqual(try Data(xdrBase64: "AAAAAQE="), data)
        // Fixed size
        struct XDRDataFixed1: XDRDataFixed {
            static var length: Int { return 1 }

            var wrapped: Data

            init() {
                self.wrapped = Data()
            }
        }
        XCTAssertEqual(try XDRDataFixed1(xdrBase64: "AQ=="), try XDRDataFixed1(data))
    }

    func testArray() {
        // Dinamic size
        let data = [Int64(1)]
        XCTAssertEqual(try decodeArrayInt64(xdrBase64: "AAAAAQAAAAAAAAAB"), data)
        struct XDRArrayFixed1<WrappedElement: XDRCodable>: XDRArrayFixed {
            typealias Element = WrappedElement
            
            static var length: Int { return 1 }
            
            var wrapped: [WrappedElement]
            
            init() {
                self.wrapped = [WrappedElement]()
            }
        }
        // Fixed size
        XCTAssertEqual(try XDRArrayFixed1<Int64>(xdrBase64: "AAAAAAAAAAE=").wrapped, try XDRArrayFixed1(data).wrapped)
    }
    
    private func decodeArrayInt64(xdrBase64: String) throws -> [Int64] {
        var data = Data(base64Encoded: xdrBase64)!
        let length = try Int32(xdrData: &data)
        var result = [Int64]()
        for _ in 1...length {
            result.append(try Int64(xdrData: &data))
        }
        
        return result
    }
    
    func testDescriminatedUnion() {
        enum TestDescriminatedUnion: XDRDiscriminatedUnion, XDRDecodable {
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

        XCTAssertEqual(
            try TestDescriminatedUnion(xdrBase64: "AAAAAAAAAAAAAAAB").toXdrBase64String(),
            TestDescriminatedUnion.a(1).toXdrBase64String()
        )
        XCTAssertEqual(
            try TestDescriminatedUnion(xdrBase64: "AAAAAQAAAAE=").toXdrBase64String(),
            TestDescriminatedUnion.b(1).toXdrBase64String()
        )
        XCTAssertEqual(
            try TestDescriminatedUnion(xdrBase64: "AAAAAg==").toXdrBase64String(),
            TestDescriminatedUnion.c.toXdrBase64String()
        )
    }

    func testStruct() {
        enum TestEnum: Int32, XDREnum {
            case a = 0
            case b = 1
            case c = -1
        }
        struct Test: XDRCodable {
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
            
            init(a: Int32, b: Int32?, c: Bool, d: TestEnum) {
                self.a = a
                self.b = b
                self.c = c
                self.d = d
            }
            
            init(xdrData: inout Data) throws {
                self.a = try Int32(xdrData: &xdrData)
                if try Bool(xdrData: &xdrData) {
                    self.b = try Int32(xdrData: &xdrData)
                } else {
                    self.b = nil
                }
                self.c = try Bool(xdrData: &xdrData)
                self.d = try TestEnum(xdrData: &xdrData)
            }
        }

        let test = Test(a: 1, b: nil, c: true, d: TestEnum.a)

        XCTAssertEqual(try Test(xdrBase64: "AAAAAQAAAAAAAAABAAAAAA==").toXdrBase64String(), test.toXdrBase64String())
    }
}

// swiftlint:enable identifier_name
