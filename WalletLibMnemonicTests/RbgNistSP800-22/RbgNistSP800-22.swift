//
//  RbgNistSP800-22.swift
//  WalletLibMnemonicTests
//
//

import XCTest
@testable import WalletLibMnemonic


class RbgNistSP800_22: XCTestCase {
    
    
    func testGenerateRandomBytesRbgNistSP800_22() {
        
        //For testing random generation algorithm install NIST SP 800-22 software using Install_RbgNistSP800_22.sh
        guard let bytes = CommonRandom.generate(length: 1500000) else {
        
            XCTAssert(false, "Can't generate bytes")
            
            return
            
        }
        
        //This function generates bytes for bit stream length = 12000000 and streams count = 10
        //Filename "testdata.pi"
        

        let path = #file.replacingOccurrences(of: "RbgNistSP800-22.swift", with: "rbg/testdata.pi")
        
        FileManager.default.createFile(atPath: path, contents: bytes, attributes: nil)

        //Run RbgNistSP800-22/rbg/assess
        
    }
    

}
