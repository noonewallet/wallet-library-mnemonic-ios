
[![License](https://img.shields.io/badge/license-MIT-black.svg?style=flat)](https://mit-license.org)
[![Platform](https://img.shields.io/badge/platform-ios-blue.svg?style=flat)](https://developer.apple.com/resources/)
[![Swift](https://img.shields.io/badge/swift-5.0-brightgreen.svg)](https://developer.apple.com/resources/)
[![Version](https://img.shields.io/badge/Version-1.0-orange.svg)]()

![Noone core](https://github.com/noonewallet/noone-android-core-crypto/assets/111989613/1f062349-24d4-4824-9c00-b8f2724eca51)

## WalletLibMnemonic

The WalletLibMnemonic library is an implementation of tools related to mnemonic phrases and seed keys.

## Requirements

* macOS 12.6
* XCode Version 14.2

## Installation

Using `CocoaPods`. 

Clone or download repo, add the following line to your `Podfile`

```ruby
# platform :ios, '10.0'

target 'YourTargetName' do
  use_frameworks!
  
  pod 'WalletLibMnemonic', :path => 'path/to/WalletLibMnemonic' 
end
```

## Usage

#### Generate mnemonic 

```swift

    do {

        let mnemonic = Mnemonic(length: .ms15)

    } catch let error {

        print("\(error)")

    }

```

#### Parsing mnemonic 
```swift

    do {
                
        let mnemonic1 = try Mnemonic(entropy: Data(hex: "7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f"), pass: "TREZOR")

        print(mnemonic1.seed.hex)  
        // "2e8905819b8723fe2c1d161860e5ee1830318dbf49a83bd451cfb8440c28bd6fa457fe1296106559a3c80937a1c1069be3a3a5bd381ee6260e8d9739fce1f607"

        print(mnemonic1.words.joined(separator: " "))
        // "legal winner thank year wave sausage worth useful legal winner thank yellow"
        
        let mnemonic2 = try Mnemonic(mnemonic: mnemonic1.words.joined(separator: " "), pass: "TREZOR", listType: .english)

        print(mnemonic2.entropy.hex)
        // "7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f"
                
    } catch let error {

        print("\(error)")

    }

```

## RBG NIST SP 800-22

For testing generation quality you can install and run NIST SP 800-22 software. Execute following script:

```
sh path/to/WalletLibMnemonic/WalletLibMnemonicTests/RbgNistSP800-22/Install_RbgNistSP800_22.sh

```
run xctest

[RbgNistSP800_22](WalletLibMnemonicTests/RbgNistSP800-22/RbgNistSP800-22.swift)

after the data is generated run the executable file 'RbgNistSP800-22/rbg/assess'

## License

MIT. See the [_LICENSE_](LICENSE) file for more info.
