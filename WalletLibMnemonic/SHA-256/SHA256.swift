//
//  SHA256.swift
//  WalletLibMnemonic
//
//

import Foundation
import CommonCrypto


extension Data {
    
    
    func sha256() -> Data {
        
        return digest(data: self)
    }
    
    
    private func digest(data : Data) -> Data {
        
        guard let res = NSMutableData(length: Int(CC_SHA256_DIGEST_LENGTH)) else { return Data() }
        
        CC_SHA256((data as NSData).bytes, CC_LONG(data.count), res.mutableBytes.assumingMemoryBound(to: UInt8.self))
        
        return res as Data
    }
    
    
}


extension String {
    
    
    func sha256() -> Data {
        
        if let stringData = self.data(using: String.Encoding.utf8) {
            
            return stringData.sha256()
            
        }
        
        return Data()
    }
    
    
}
