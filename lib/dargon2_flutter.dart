
import 'dart:async';

import 'package:flutter/services.dart';

class Dargon2Flutter {
  static const MethodChannel _channel =
      const MethodChannel('dargon2_flutter');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
