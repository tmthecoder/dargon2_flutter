#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint dargon2_flutter.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'dargon2_flutter'
  s.version          = '0.0.1'
  s.summary          = 'The Flutter Implementation of dargon2'
  s.description      = <<-DESC
  Dargon2_flutter is the Flutter implementation of dargon2, which is a plugin built
  using dart to hash with the Password Hashing Algorithm, Argon2.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Tejas Mehta' => 'tmthecoder@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files =
    'Classes/Dargon2FlutterPlugin.h',
    'Classes/Dargon2FlutterPlugin.m',
    'Classes/Argon2/*.{c,h}',
    'Classes/Argon2/src/core.{c,h}',
    'Classes/Argon2/src/thread.{c,h}',
    'Classes/Argon2/src/encoding.{c,h}',
    'Classes/Argon2/src/blake2/blake2.h',
    'Classes/Argon2/src/blake2/blake2b.c',
    'Classes/Argon2/src/blake2/blake2-impl.h',
#     'Classes/Argon2/argon2.h'
  s.ios.source_files =
    'Classes/Argon2/src/ref.c',
    'Classes/Argon2/src/blake2/blamka-round-ref.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
  s.public_header_files = 'Classes/Argon2/*.h', 'Classes/*.h'
  s.preserve_paths = 'Classes/Argon2'
  s.requires_arc = true
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
    'SWIFT_INCLUDE_PATHS[sdk=iphoneos*]'          => '$(PODS_TARGET_SRCROOT)/Classes/Argon2',
    'SWIFT_INCLUDE_PATHS[sdk=iphonesimulator*]'   => '$(PODS_TARGET_SRCROOT)/Classes/Argon2',
  }
  s.swift_version = '5.0'
end
