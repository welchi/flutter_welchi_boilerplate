import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/data/providers/providers.dart';

class RootPage extends HookWidget {
  static String routeName = '/';
  @override
  Widget build(BuildContext context) {
    useProvider(rootProvider);
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
