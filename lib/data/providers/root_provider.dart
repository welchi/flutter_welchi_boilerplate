import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/data/providers/providers.dart';
import 'package:my_app/ui/pages/pages.dart';

final rootProvider = Provider<void>((ref) {
  final navigatorKey = ref.read(navigatorKeyProvider);
  fa.FirebaseAuth.instance.authStateChanges().listen((user) async {
    // ユーザが未登録・サインアウト中
    if (user == null) {
      await navigatorKey.currentState.pushReplacementNamed(
        LoginPage.routeName,
      );
      // ユーザがサインイン中
    } else {
      await navigatorKey.currentState.pushReplacementNamed(
        HomePage.routeName,
      );
    }
  });
});
