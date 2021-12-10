/// Made by Tejas Mehta
/// Made on Thursday, December 09, 2021
/// File Name: dargon2_flutter_platform.dart

import 'package:dargon2_flutter_platform_interface/empty_dargon2_flutter.dart';
import 'package:dargon2_interface/dargon2_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

DArgon2 argon2 = DArgon2Platform.instance;

abstract class DArgon2Platform extends PlatformInterface with DArgon2 {
  static final Object _token = Object();

  DArgon2Platform() : super(token: _token);

  static DArgon2Platform _instance = EmptyDargon2Flutter();

  /// The default instance of [UrlLauncherPlatform] to use.
  ///
  /// Defaults to [MethodChannelUrlLauncher].
  static DArgon2Platform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [UrlLauncherPlatform] when they register themselves.
  static set instance(DArgon2Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
