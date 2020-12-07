
import 'dart:async';

import 'package:dargon2/dargon2.dart';
import 'package:flutter/services.dart';

class Dargon2Flutter {
  static const MethodChannel _channel =
      const MethodChannel('dargon2_flutter');

  static Future<String> get platformVersion async {
     DArgon2Result res = argon2.hashPasswordString("password", salt: Salt.newSalt());
     return "${argon2.verifyHashString("password", res.encodedString)}";
  }

}
