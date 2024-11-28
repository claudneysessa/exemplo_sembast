import 'dart:convert';

import '../../commons/application_crypt.dart';
import 'package:sembast/sembast.dart';

class SembastServiceCodec extends AsyncContentCodecBase {
  @override
  Future<Object?> decodeAsync(String encoded) async {
    return jsonDecode(ApplicationCrypt.descriptografar(encoded));
  }

  @override
  Future<String> encodeAsync(Object? input) async {
    return ApplicationCrypt.criptografar(jsonEncode(input));
  }
}
