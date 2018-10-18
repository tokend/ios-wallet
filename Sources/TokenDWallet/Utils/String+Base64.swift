import Foundation

extension String {
    public var dataFromBase64: Data? {
        return Data(base64Encoded: self)
    }
}
