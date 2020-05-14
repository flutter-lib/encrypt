import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:pointycastle/asymmetric/api.dart';

void main() async {
  final publicKey = await parseKeyFromFile<RSAPublicKey>('test/public.pem');
  final privateKey = await parseKeyFromFile<RSAPrivateKey>('test/private.pem');

  final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';

  final signer = Signer(RSASigner(RSASignDigest.SHA1, publicKey: publicKey, privateKey: privateKey));
  Encrypted encrypted = signer.sign(plainText);

  print('验签结果：${signer.verify(plainText, encrypted)}');


}
