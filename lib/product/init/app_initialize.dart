import 'dart:async';

import 'package:flutter/material.dart';

@immutable
final class AppInitialize {
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
  }
}
