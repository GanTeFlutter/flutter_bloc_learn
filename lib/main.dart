import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/feature/202/home/no_context_conection_view.dart';
import 'package:flutter_bloc_example/feature/303/home/bloc_ob_deneme_view.dart';
import 'package:flutter_bloc_example/product/init/app_initialize.dart';
import 'package:flutter_bloc_example/product/init/state_initialize.dart';
import 'package:flutter_bloc_example/product/navigation/app_gorouter.dart';
import 'package:flutter_bloc_example/product/theme/theme.dart';
import 'package:go_router/go_router.dart';

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
      theme: AppTheme.darkTheme,
      title: 'ColorCraftPro',
      routerConfig: router,
    );
  }
}

class BaseNavigatonScreen extends StatelessWidget {
  const BaseNavigatonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.goNamed('StreamBaseView'),
              child: const Text('StreamBaseView'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoContextConectionView(),
                  ),
                );
              },
              child: const Text('NoContextConectionView'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocObDenemeView(),
                  ),
                );
              },
              child: const Text('BlocObDenemeView'),
            ),
          ],
        ),
      ),
    );
  }
}
