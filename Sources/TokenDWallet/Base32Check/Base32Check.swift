import Foundation

/// Performs encoding and decoding of specific data to Base32Check.
/// Base32Check is Base32 encoding with version byte and checksum
/// `[version byte] + [data] + [CRC16 checksum of version byte and data]`
public enum Base32Check {
    
    /// Key encoding errors
    ///
    /// - invalidEncodedString: Input is not Base32 encoded string
    /// - invalidVersionByte: Unknown version byte
    /// - invalidChecksum: Encoded data does not conform checksum
    public enum DecodingError: Swift.Error {
        case invalidEncodedString
        case invalidVersionByte
        case invalidChecksum
    }
    
    /// Version byte is used to determine encoded data type
    public enum VersionByte: UInt8 {
        case accountIdEd25519 = 48     // 'G'
        case seedEd25519      = 144    // 'S'
        case balanceIdEd25519 = 8      // 'B'
    }
    
    /// Checks if encoded string has correct data of specified type
    ///
    /// - Parameters:
    ///   - versionByteName: Indicates data type
    ///   - encoded: Encoded string
    /// - Returns: true if string is valid data of specified version
    public static func isValid(expectedVersion: VersionByte, encoded: String) -> Bool {
        do {
            _ = try self.decodeCheck(expectedVersion: expectedVersion, encoded: encoded)
            return true
        } catch {
            return false
        }
    }
    
    /// Decodes data from Base32Check encoding
    ///
    /// - Parameter encoded: Encoded data
    /// - Returns: VersionByte and data in tupple
    /// - Throws: `Base32Check.DecodingError`
    public static func decode(encoded: String) throws -> (version: VersionByte, data: Data) {
        guard let decoded = base32Decode(encoded) else {
            throw DecodingError.invalidEncodedString
        }
        
        let versionByte = decoded[0]
        let payload = decoded[0...decoded.count - 3]
        let data = payload[1...payload.count - 1]
        let checksum = decoded[decoded.count - 2...decoded.count - 1]
        
        if !self.verifyChecksum(expected: Array(checksum), data: Array(payload)) {
            throw DecodingError.invalidChecksum
        }
        
        guard let version = VersionByte(rawValue: versionByte) else {
            throw DecodingError.invalidVersionByte
        }
        
        return (version, Data(data))
    }
    
    /// Decodes data with verifying data type and checksum
    ///
    /// - Parameters:
    ///   - expectedVersion: Indicates the type of data,
    ///   if data will have different type it will throw `DecodingError.invalidVersionByte`
    ///   - encoded: Encoded string
    /// - Returns: Decoded data
    /// - Throws: `Base32Check.DecodingError`
    public static func decodeCheck(expectedVersion: VersionByte, encoded: String) throws -> Data {
        let (version, data) = try self.decode(encoded: encoded)
        
        if version != expectedVersion {
            throw DecodingError.invalidVersionByte
        }
        
        return data
    }
    
    /// Encodes data of specified type to Base32Check encoding
    ///
    /// - Parameters:
    ///   - version: Indicates type of data
    ///   - data: Data to encode
    /// - Returns: Base32Check encoded string
    public static func encode(version: VersionByte, data: Data) -> String {
        var toEncode = Data()
        toEncode.append(version.rawValue)
        toEncode.append(data)
        let checksum = self.calculateChecksum(forData: Array(toEncode))
        toEncode.append(contentsOf: checksum)
        
        return base32Encode(toEncode)
    }
    
    /// Calculates CRC16 checksum for specified data
    ///
    /// - Parameter data: Data for calculating checksum
    /// - Returns: CRC16 checksum as Buffer in little-endian order
    private static func calculateChecksum(forData data: [UInt8]) -> [UInt8] {
        return CRC16().calculateChecksum(forData: data)
    }
    
    /// Checks if data has fits checksum
    ///
    /// - Parameters:
    ///   - expected: Expected CRC16 checksum
    ///   - data: Data for calculating checksum
    /// - Returns: true if expected checksum is equal to data checksum
    private static func verifyChecksum(expected: [UInt8], data: [UInt8]) -> Bool {
        let actual = self.calculateChecksum(forData: data)
        
        if expected.count != actual.count {
            return false
        }
        
        for index in 0...expected.count - 1 where expected[index] != actual[index] {
            return false
        }
        
        return true
    }
}

/// Calculates CRC16 checksum
private class CRC16 {
    private var crcTable: [Int] = []
    private let gPloy = 0x1021
    
    init() {
        self.computeCrcTable()
    }
    
    func calculateChecksum(forData data: [UInt8]) -> [UInt8] {
        var crc = self.getCrc(data: data)
        var crcArr: [UInt8] = [0, 0]
        for index in 0..<2 {
            crcArr[index] = UInt8(crc % 256)
            crc >>= 8
        }
        return crcArr
    }
    
    /**
     Generate CRC16 Code of 0-255
     */
    private func computeCrcTable() {
        for index in 0..<256 {
            self.crcTable.append(self.getCrcOfByte(aByte: index))
        }
    }
    
    private func getCrcOfByte(aByte: Int) -> Int {
        var value = aByte << 8
        for _ in 0 ..< 8 {
            if (value & 0x8000) != 0 {
                value = (value << 1) ^ self.gPloy
            } else {
                value = value << 1
            }
        }
        
        value = value & 0xFFFF //get low 16 bit value
        
        return value
    }
    
    private func getCrc(data: [UInt8]) -> UInt16 {
        var crc = 0
        let dataInt: [Int] = data.map { Int($0) }
        
        let length = data.count
        
        for index in 0 ..< length {
            crc = ((crc & 0xFF) << 8) ^ self.crcTable[(((crc & 0xFF00) >> 8) ^  dataInt[index]) & 0xFF]
        }
        
        crc = crc & 0xFFFF
        return UInt16(crc)
    }
    
}
