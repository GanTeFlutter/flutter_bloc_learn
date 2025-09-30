import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/feature/303/state/bloc_observer.dart';
import 'package:flutter_bloc_example/product/service/service_locator.dart';

@immutable
final class AppInitialize {
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    setupLocator();

    Bloc.observer = const MyBlocObserver();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
  }
}
