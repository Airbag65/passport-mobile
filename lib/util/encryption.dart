import 'package:passport_mobile/util/storage.dart';
import 'package:pointycastle/export.dart';
import 'package:asn1lib/asn1lib.dart';
import 'dart:convert';
import 'dart:typed_data';

RSAPublicKey _parsePublicKeyFromPem() {
  final String pem = getPemString();
  final pemBody = pem
      .replaceAll('-----BEGIN RSA PUBLIC KEY-----', '')
      .replaceAll('-----END RSA PUBLIC KEY-----', '')
      .replaceAll('-----BEGIN PUBLIC KEY-----', '')
      .replaceAll('-----END PUBLIC KEY-----', '')
      .replaceAll('\n', '')
      .trim();

  final derBytes = base64.decode(pemBody);
  final asn1Parser = ASN1Parser(Uint8List.fromList(derBytes));
  final topLevelSeq = asn1Parser.nextObject() as ASN1Sequence;

  BigInt modulus = (topLevelSeq.elements[0] as ASN1Integer).valueAsBigInteger;
  BigInt exponent = (topLevelSeq.elements[1] as ASN1Integer).valueAsBigInteger;
  return RSAPublicKey(modulus, exponent);
}

String enctryptPassword(String password) {
  final publicKey = _parsePublicKeyFromPem();

  final cipher = OAEPEncoding.withSHA256(RSAEngine());
  cipher.init(true, PublicKeyParameter<RSAPublicKey>(publicKey));

  final inputBytes = Uint8List.fromList(utf8.encode(password));
  final encrypted = cipher.process(inputBytes);

  return base64.encode(encrypted);
}
