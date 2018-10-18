import Foundation

extension Optional: XDREncodable {
    public func toXDR() -> Data {
        var xdr = Data()

        switch self {
        case .some(let value):
            if let value = value as? XDREncodable {
                xdr += true.toXDR() + value.toXDR()
            }
        case nil:
            xdr += false.toXDR()
        }

        return xdr
    }
}
