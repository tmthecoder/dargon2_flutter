# dargon2_flutter
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A wrapper plugin over the [dargon2] plugin to handle the platform-specific dart:ffi integrations for iOS and Android
Uses the reference C implementation of [Argon2], winner of the [Password Hash Competition]

[Password Hash Competition]: https://password-hashing.net
[dargon2]: https://github.com/tmthecoder/dargon2

## Pure Objective-C iOS
If you're using Objective-C for the iOS portion of your application (created with Objective-C and no Swift code), there's a few extra steps:
- Open the Xcode workspace (type in `open iOS/Runner.xcworkspace` in the terminal in the project's root directory)
- Right click the `Runner` directory (Folder, not project/workspace) 
- Click `New File`
- Select `Swift File` in the prompt 
- (**This is the Important Step**) Select `Create Bridging Header` when the prompt comes up
- You don't have to add anything to that swift file or the bridging header, but it needs to be there along with the bridging header in order for the plugin to compile correctly for iOS

## Usage

High-level hashing and verification (for direct hashing & verification of byte arrays, check the example on [dargon2])

```dart
void _hash() async {
   var password = 'password';
   //use Salt(List<int> bytes) for a salt from an Integer list
   var s = Salt.newSalt();
   //Hash with pre-set params (iterations: 32, memory: 256, parallelism: 2, 
   //length: 32, type: Argon2Type.i, version: Argon2Version.V13)
   var result = await argon2.hashPasswordString(password, salt: s);
   
   //Raw hash values available as int list, base 64 string, and hex string
   var bytesRaw = result.rawBytes;
   var base64Hash = result.base64String;
   var hexHash = result.hexString;
   
   //Encoded hash values available as int list and encoded string
   var bytesEncoded = result.encodedBytes;
   var stringEncoded = result.encodedString;
   
   //Verify password (returns true/false), uses default type (Argon2Type.i)
   var verified = await argon2.verifyHashString(password, stringEncoded);
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/tmthecoder/dargon2_flutter/issues

## Licensing

- dargon2_flutter is Licensed under the [MIT License]
- dargon2 is Licensed under the [MIT License]
- The C implementation of [Argon2] is licensed under a dual [Apache and CC0 License]

[MIT License]: https://github.com/tmthecoder/dargon2_flutter/blob/main/LICENSE

[Argon2]: https://github.com/P-H-C/phc-winner-argon2

[Apache and CC0 License]: https://github.com/P-H-C/phc-winner-argon2/blob/master/LICENSE
