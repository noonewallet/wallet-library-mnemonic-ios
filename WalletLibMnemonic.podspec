#
#  Be sure to run `pod spec lint WalletLibMnemonic.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "WalletLibMnemonic"
  s.version      = "1.0"
  s.summary      = "The WalletLibMnemonic library is an implementation of tools for working with mnemonic"
  s.homepage	 = "https://github.com/noonewallet/wallet-library-mnemonic-ios"

  s.license      = "MIT"
  s.author       = "WalletLibMnemonic"

  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/noonewallet/wallet-library-mnemonic-ios.git", :tag => "v#{s.version}" }
  s.swift_version = '5.0'

  s.ios.deployment_target = "11.0"
  s.osx.deployment_target = "11.0"

  s.source_files  = 'WalletLibMnemonic/WalletLibMnemonic.h', 'WalletLibMnemonic/*{h}', 'WalletLibMnemonic/**/*{m,c,swift}'

end
