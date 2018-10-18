import Foundation

public protocol XDRDiscriminatedUnion: XDREncodable {
    var discriminant: Int32 { get }
}
