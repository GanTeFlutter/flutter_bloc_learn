import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/example/multi_state/home/home_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeViewMulti();
      },
    ),
  ],
);
