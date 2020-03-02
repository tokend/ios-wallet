import Foundation

public enum XDRErrors: Swift.Error {
    case wrongDataLength
    case decodingError
    case base64DecodeError
    case unknownEnumCase
}
