# Copyright 2020 Tejas Mehta <tmthecoder@gmail.com>
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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
    'Classes/Argon2/src/argon2.c',
    'Classes/Argon2/src/core.{c,h}',
    'Classes/Argon2/src/thread.{c,h}',
    'Classes/Argon2/src/encoding.{c,h}',
    'Classes/Argon2/src/blake2/blake2.h',
    'Classes/Argon2/src/blake2/blake2b.c',
    'Classes/Argon2/src/blake2/blake2-impl.h',
    'Classes/Argon2/include/**/*.h'
  s.ios.source_files =
    'Classes/Argon2/src/ref.c',
    'Classes/Argon2/src/blake2/blamka-round-ref.h'
  s.osx.source_files =
    'phc-winner-argon2/src/opt.c',
    'phc-winner-argon2/src/blake2/blamka-round-opt.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
  s.public_header_files = 'Classes/Argon2/include/**/*.h', 'Classes/Dargon2FlutterPlugin.h'
  s.preserve_paths = 'Classes/Argon2', 'Classes/Argon2/include/**/*.h'
  s.requires_arc = true
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
    'SWIFT_INCLUDE_PATHS[sdk=iphoneos*]'          => '$(PODS_TARGET_SRCROOT)/Classes/Argon2 $(PODS_TARGET_SRCROOT)/Classes/Argon2/include',
    'SWIFT_INCLUDE_PATHS[sdk=iphonesimulator*]'   => '$(PODS_TARGET_SRCROOT)/Classes/Argon2 $(PODS_TARGET_SRCROOT)/Classes/Argon2/include',
  }
  s.swift_version = '5.0'
end
