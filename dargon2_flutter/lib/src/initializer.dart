import 'package:dargon2_flutter_mobile/dargon2_flutter_mobile.dart';
import 'package:dargon2_flutter_platform_interface/dargon2_flutter_platform.dart';
import 'package:flutter/foundation.dart';

/// Made by Tejas Mehta
/// Made on Thursday, December 09, 2021
/// File Name: initializer.dart

class DArgon2Flutter {
  static void initialize() {
    if (!kIsWeb) {
      DArgon2Platform.instance = DArgon2Mobile();
    }
  }
}
