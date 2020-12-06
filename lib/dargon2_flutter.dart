
import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';

import 'package:dargon2/dargon2.dart';
import 'package:flutter/services.dart';

typedef _argon2_hash = Int32 Function(
    Uint32 t_cost,
    Uint32 m_cost,
    Uint32 parallelism,
    Pointer<Uint8> pwd,
    IntPtr pwdlen,
    Pointer<Uint8> salt,
    IntPtr saltlen,
    Pointer<Uint8> hash,
    IntPtr hashlen,
    Pointer<Uint8> encoded,
    IntPtr encodedlen,
    Uint32 type,
    Uint32 version,
    );

typedef _Argon2Hash = int Function(
    int t_cost,
    int m_cost,
    int parallelism,
    Pointer<Uint8> pwd,
    int pwdlen,
    Pointer<Uint8> salt,
    int saltlen,
    Pointer<Uint8> hash,
    int hashlen,
    Pointer<Uint8> encoded,
    int encodedlen,
    int type,
    int version,
    );

class Dargon2Flutter {
  static const MethodChannel _channel =
      const MethodChannel('dargon2_flutter');

  static Future<String> get platformVersion async {

    return hash(utf8.encode("password"), Salt.newSalt().bytes);
  }

  static String hash(List<int> password, List<int> salt) {
    DynamicLibrary lib = DynamicLibrary.process();
    Function getHash = lib
        .lookup<NativeFunction<_argon2_hash>>('argon2_hash')
        .asFunction<_Argon2Hash>();
    //Create pointers to pass to the C method
    var passPointer = _setPtr(password);
    var saltPointer = _setPtr(salt);
    var hash = _setPtr(List.filled(32, 0));
    var encoded = _setPtr(List.filled(200, 0));
    var v = 0x13;
    var result = getHash(
        32,
        1024,
        8,
        passPointer,
        password.length,
        saltPointer,
        salt.length,
        hash,
        32,
        encoded,
        200,
        Argon2Type.id,
        v);
    //Create new Lists of the hash and encoded values
    var hashBytes = List<int>.from(hash.asTypedList(32).cast());
    var encodedBytes =
    List<int>.from(encoded.asTypedList(200).cast());
    if (encodedBytes.last == 0) {
      encodedBytes.removeLast();
    }
    //Free all pointers
    free(hash);
    free(encoded);
    free(saltPointer);
    free(passPointer);
    // if (DArgon2ErrorCode.values[result.abs()] != DArgon2ErrorCode.ARGON2_OK) {
    //   throw DArgon2Exception(
    //       Utf8.fromUtf8(LocalBinder.instance.getErrorMessage(result)),
    //       DArgon2ErrorCode.values[result.abs()]);
    // }
    return base64Encode(hash.asTypedList(32));
  }
  static Pointer<Uint8> _setPtr(Iterable<int> iterable) {
    //Allocate a pointer in memory and set the values from the given list
    var p = allocate<Uint8>(count: Uint8List.fromList(iterable).length);
    p.asTypedList(iterable.length).setAll(0, iterable);
    return p;
  }

}
