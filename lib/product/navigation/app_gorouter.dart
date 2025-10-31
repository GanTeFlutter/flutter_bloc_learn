import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/feature/404/home/404home.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return AppProvider();
      },
    ),
  ],
);
