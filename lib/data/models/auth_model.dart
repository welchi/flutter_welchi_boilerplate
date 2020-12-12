import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/util/logger.dart';

final authModelProvider = Provider(
  (ref) => AuthModel(ref.read),
);

class AuthModel {
  AuthModel(this._read);
  final Reader _read;
  final _googleSignIn = GoogleSignIn(scopes: [
    'email',
  ]);

  /// Googleアカウントを使ってサインイン
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      logger.warning(e.toString());
    } on Exception catch (e) {
      logger.warning(e.toString());
    }
  }
}
