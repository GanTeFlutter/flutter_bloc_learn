import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/main.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SamplesScreen();
      },
    ),
  ],
);
