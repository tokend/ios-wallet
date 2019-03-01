import Foundation

public protocol XDREnum: RawRepresentable, XDREncodable, CaseIterable { }

extension XDREnum where RawValue: XDREncodable {
    public func toXDR() -> Data {
        return self.rawValue.toXDR()
    }
}
