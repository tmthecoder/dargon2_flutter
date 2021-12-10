/// Made by Tejas Mehta
/// Made on Thursday, December 09, 2021
/// File Name: argon2.dart.dart
/// Package: lib.src

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dargon2_flutter_platform_interface/dargon2_flutter_platform.dart';
import 'package:dargon2_interface/dargon2_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

class Dargon2FlutterWeb extends DArgon2Platform {
  static void registerWith(Registrar registrar) {
    DArgon2Platform.instance = Dargon2FlutterWeb();
  }

  @override
  Future<DArgon2Result> hashPasswordBytes(List<int> password,
      {required Salt salt,
      int iterations = 32,
      int memory = 256,
      int parallelism = 2,
      int length = 32,
      Argon2Type type = Argon2Type.i,
      Argon2Version version = Argon2Version.V13}) async {
    var params = _HashParams(
        password: Uint8List.fromList(password),
        salt: Uint8List.fromList(salt.bytes),
        iterations: iterations,
        memorySize: memory,
        parallelism: parallelism,
        hashLength: length,
        outputType: 'encoded');
    var encoded;
    try {
      switch (type) {
        case Argon2Type.i:
          encoded = await promiseToFuture(_argon2iHash(params));
          break;
        case Argon2Type.d:
          encoded = await promiseToFuture(_argon2dHash(params));
          break;
        case Argon2Type.id:
          encoded = await promiseToFuture(_argon2idHash(params));
          break;
      }
      var hash = _normalizeB64(encoded.split('\$').last);
      return DArgon2Result(base64Decode(hash), utf8.encode(encoded));
    } catch (e) {
      throw DArgon2Exception(
          e.toString(), DArgon2ErrorCode.ARGON2_UNKNOWN_ERROR);
    }
  }

  @override
  Future<bool> verifyHashBytes(List<int> password, List<int> encodedHash,
      {Argon2Type type = Argon2Type.i}) {
    try {
      return promiseToFuture(_verify(_VerificationParams(
        password: Uint8List.fromList(password),
        hash: utf8.decode(encodedHash),
      )));
    } catch (e) {
      throw DArgon2Exception(
          e.toString(), DArgon2ErrorCode.ARGON2_UNKNOWN_ERROR);
    }
  }

  String _normalizeB64(String source) {
    var current = source;
    while (current.length % 4 != 0) {
      current += '=';
    }
    return current;
  }
}

@JS('hashwasm.argon2i')
external _Promise<String> _argon2iHash(_HashParams params);

@JS('hashwasm.argon2d')
external _Promise<String> _argon2dHash(_HashParams params);

@JS('hashwasm.argon2id')
external _Promise<String> _argon2idHash(_HashParams params);

@JS('hashwasm.argon2Verify')
external _Promise<bool> _verify(_VerificationParams params);

@JS('Promise')
class _Promise<T> {
  external factory _Promise._();
}

@JS()
@anonymous
class _HashParams {
  /* From JS:
    password: IDataType; // password (or message) to be hashed
    salt: IDataType; // salt (usually containing random bytes)
    iterations: number; // number of iterations to perform
    parallelism: number; // degree of parallelism
    memorySize: number; // amount of memory to be used in kibibytes (1024 bytes)
    hashLength: number; // output size in bytes
    outputType?: 'hex' | 'binary' | 'encoded'; // by default returns hex string
   */

  external factory _HashParams(
      {Uint8List password,
      Uint8List salt,
      int iterations,
      int parallelism,
      int memorySize,
      int hashLength,
      String outputType});
}

@JS()
@anonymous
class _VerificationParams {
  /* From JS:
    password: IDataType, // password
    hash: string, // encoded hash
   */

  external factory _VerificationParams({Uint8List password, String hash});
}
