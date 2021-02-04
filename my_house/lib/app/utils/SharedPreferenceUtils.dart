import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SharedPreferenceUtils {
  final _storage = FlutterSecureStorage();


  saveEncryptedValues(String key, value) async {
    await _storage.write(key: key, value: json.encode(value));
  }


  readEncryptedValues(String key) async {
    print(await _storage.read(key: key));
    String value = await _storage.read(key: key);
    if(value==null){
      return null;
    }

    return value;
  }
}