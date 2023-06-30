//
//  MnemonicTest.swift
//  WalletLibMnemonicTests
//
//

import XCTest
@testable import WalletLibMnemonic


final class MnemonicTest: XCTestCase {
    
    
    func testMnemonic() {
       
        for item in MnemonicTestVector.vectors {
            
            do {
                
                let mnemonic1 = try Mnemonic(entropy: Data(hex: item.entropy), pass: "TREZOR")
                let mnemonic2 = try Mnemonic(mnemonic: item.phrase, pass: "TREZOR", listType: .english)
                
                XCTAssertFalse(mnemonic1.entropy.hex != item.entropy,
                               "Wrong entropy Expected: \(item.entropy) Result: \(mnemonic1.entropy.hex)")
                XCTAssertFalse(mnemonic2.entropy.hex != item.entropy,
                               "Wrong entropy Expected: \(item.entropy) Result: \(mnemonic2.entropy.hex)")
                XCTAssertFalse(mnemonic1.seed.hex != item.seed,
                               "Wrong seed Expected: \(item.seed) Result: \(mnemonic1.seed.hex)")
                XCTAssertFalse(mnemonic2.seed.hex != item.seed,
                               "Wrong seed Expected: \(item.seed) Result: \(mnemonic2.seed.hex)")
                
            } catch {
                
                XCTAssertFalse(false, "Test failed")
                
            }
        }
    }
    

}




// Util


public extension String {
    
    
    func dropPrefix(prefix: String) -> String {
        
        guard self.hasPrefix(prefix) else { return self }
        
        return String(self.dropFirst(prefix.count))
    }
    
    
    func components(maxLength: Int, backwards: Bool = false) -> [String] {
        
        var result: [String] = []
        
        for i in stride(from: 0, to: self.count, by: maxLength) {
            
            let str: String = backwards ? String(self.dropLast(i).suffix(maxLength)) : String(self.dropFirst(i).prefix(maxLength))
            result.append(str)
            
        }
        
        return  backwards ? result.reversed() : result
    }
    
    
}


public extension Data {
    
    
    init(hex: String) {
        
        let hexstr = hex.dropPrefix(prefix: "0x")
        var data = Data(capacity: (hex.count / 2) + (hex.count % 2))
        
        for hexByte in hexstr.components(maxLength: 2, backwards: true) {
            
            guard var byte = UInt8(hexByte, radix: 16) else {
                
                self = Data()
                return
                
            }
            
            data.append(&byte, count: 1)
            
        }

        self = data
    }
    
    
    var hex: String {
        
        return self.map({ String(format: "%02x", $0) }).joined()
    }
    
    
    var dropedPrefixZeros: Data {
        
        var lastValuePosition = 0
        
        for i in 0..<self.count {
            
            if self[i] != 0 { break }
            lastValuePosition += 1
            
        }
        
        return self.subdata(in: lastValuePosition..<count)
    }
    
    
}
