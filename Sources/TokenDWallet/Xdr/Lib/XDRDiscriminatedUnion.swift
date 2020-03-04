import Foundation

public protocol XDRDiscriminatedUnion: XDRCodable {
    var discriminant: Int32 { get }
}
