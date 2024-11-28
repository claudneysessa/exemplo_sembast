abstract class ApplicationCrypt {
  static String criptografar(String texto) {
    final mapa = <String, String>{};
    for (int i = 0; i < 256; i++) {
      mapa[String.fromCharCode(i)] = String.fromCharCode((i + 5) % 256);
    }
    String key = '';
    for (int i = 0; i < texto.length; i++) {
      key += mapa[texto[i]] ?? '';
    }
    return key;
  }

  static String descriptografar(String texto) {
    final mapa = <String, String>{};
    for (int i = 0; i < 256; i++) {
      mapa[String.fromCharCode((i + 5) % 256)] = String.fromCharCode(i);
    }
    String key = '';
    for (int i = 0; i < texto.length; i++) {
      key += mapa[texto[i]] ?? '';
    }
    return key;
  }
}
