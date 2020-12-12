import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/data/models/model.dart';

class LoginPage extends HookWidget {
  static String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authModelProvider);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AutoSizeText(
                  'MyAppへようこそ',
                  style: Theme.of(context).textTheme.headline2,
                  maxLines: 1,
                ),
              ),
              const Gap(
                32,
              ),
              SignInButton(
                Buttons.GoogleDark,
                onPressed: auth.signInWithGoogle,
              ),
              const Gap(
                8,
              ),
              SignInButton(
                Buttons.Apple,
                onPressed: () {},
              ),
              const Gap(
                32,
              ),
              const Text(
                'プライバシーポリシー',
              ),
              const Text(
                '利用規約',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
