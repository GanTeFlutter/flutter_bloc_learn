import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/product/init/app_initialize.dart';
import 'package:flutter_bloc_example/product/init/state_initialize.dart';
import 'package:flutter_bloc_example/product/navigation/app_gorouter.dart';

Future<void> main() async {
  await AppInitialize().make();
  runApp(StateInitialize(child: const _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: router,
    );
  }
}
