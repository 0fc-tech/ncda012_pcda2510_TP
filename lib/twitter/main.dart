import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
    return Platform.isIOS?
    CupertinoApp.router(
        title: 'Material App',
        routerConfig: _router
    )

        :
    MaterialApp.router(
      title: 'Material App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:kIsWeb? Colors.green: Colors.blue),
      ),
      routerConfig: _router,
    );
  }
}
