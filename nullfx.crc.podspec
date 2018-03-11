#
# Be sure to run `pod lib lint nullfx.crc.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'nullfx.crc'
  s.version          = '1.0.0'
  s.summary          = 'nullfx crc is a small set of CRC utilities (crc8, crc16, and crc32) written in native swift released under the MIT License'

  s.description      = <<-DESC
nullfx crc is a small set of CRC utilities: crc8, various crc16 implementations, and crc32 written in swift released under the MIT License
                       DESC

  s.homepage         = 'https://github.com/nullfx/swift-nullfx.crc'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nullfx' => 'steve@nullfx.com' }
  s.source           = { :git => 'https://github.com/nullfx/swift-nullfx.crc.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'nullfx.crc/Classes/**/*'
end
