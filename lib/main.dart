import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/example/flutter_timer/view/timer_page.dart'
    show TimerPage;
import 'package:flutter_bloc_example/product/init/app_initialize.dart';
import 'package:flutter_bloc_example/product/init/state_initialize.dart';
import 'package:flutter_bloc_example/product/navigation/app_gorouter.dart';
import 'package:flutter_bloc_example/product/theme/theme.dart';

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
      title: 'ColorCraftPro',
      routerConfig: router,
    );
  }
}

class SamplesScreen extends StatefulWidget {
  const SamplesScreen({super.key});

  @override
  State<SamplesScreen> createState() => _SamplesScreenState();
}

class _SamplesScreenState extends State<SamplesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SamplesScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('TimerPage')),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const TimerPage()),
                );
              },
              child: Text('SamplesScreen'),
            ),
            ElevatedButton(onPressed: () {}, child: Text('SamplesScreen')),
            Text('SamplesScreen'),
          ],
        ),
      ),
    );
  }
}
