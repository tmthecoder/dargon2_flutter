/// Made by Tejas Mehta
/// Made on Thursday, December 09, 2021
/// File Name: dargon2_loader_native.dart

import 'package:dargon2_core/dargon2_core.dart';
import '../native/flutter_lib_loader.dart';

DArgon2 getLibrary() => DArgon2Native(FlutterLibLoader());
