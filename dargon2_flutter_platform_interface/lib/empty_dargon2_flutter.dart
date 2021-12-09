import 'package:dargon2_flutter_platform_interface/dargon2_flutter_platform.dart';
import 'package:dargon2_interface/dargon2_interface.dart';

/// Made by Tejas Mehta
/// Made on Thursday, December 09, 2021
/// File Name: empty_dargon2_flutter.dart

class EmptyDargon2Flutter extends DArgon2Platform {
  @override
  Future<DArgon2Result> hashPasswordBytes(List<int> password, {required Salt salt, int iterations = 32, int memory = 256, int parallelism = 2, int length = 32, Argon2Type type = Argon2Type.i, Argon2Version version = Argon2Version.V13}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyHashBytes(List<int> password, List<int> encodedHash, {Argon2Type type = Argon2Type.i}) {
    throw UnimplementedError();
  }
}
