import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp/twitter/login_page.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/', builder: (_, _) => HomePage()),
    GoRoute(path: '/login', builder: (_, _) => LoginPage()),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routerConfig: _router,
    );
  }
}
