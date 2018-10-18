import Foundation

public protocol XDREnum: RawRepresentable, XDREncodable { }

extension XDREnum where RawValue: XDREncodable {
    public func toXDR() -> Data {
        return self.rawValue.toXDR()
    }
}
