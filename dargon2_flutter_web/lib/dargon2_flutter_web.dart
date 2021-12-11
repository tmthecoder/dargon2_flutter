// Copyright 2021 Tejas Mehta <tmthecoder@gmail.com>
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

/// All of the actual hashing and dart:ffi code is located in the [dargon2] plugin. To view the api reference
/// for the actual hashing methods, take a look at dargon2's API Reference
///
/// [dargon2]: https://pub.dev/documentation/dargon2/latest/
/// [API Reference]: https://pub.dev/documentation/dargon2/latest/
///
/// This is a wrapper library to hash and verify strings using the Argon2 hashing algorithm
///
/// To use this library in your code:
///
///     import 'package:dargon2_flutter/dartgon2_flutter.dart';
///
/// For detailed usage please look at the example
export 'package:dargon2_flutter_platform_interface/dargon2_flutter_platform.dart'
    hide DArgon2Platform;
export 'src/argon2.dart';

/// Export the package's methods as well in order to conveniently access result classes
/// and other such items, like error codes
export 'package:dargon2_interface/dargon2_interface.dart';
