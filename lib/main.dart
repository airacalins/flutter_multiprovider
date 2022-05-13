// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_playground/models/settings_data.dart';
import 'package:flutter_playground/models/user.dart';
import 'package:flutter_playground/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building MyApp');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => SettingsData())),
        ChangeNotifierProvider(create: ((context) => User())),
      ],
      builder: (context, child) {
        return MaterialApp(
          initialRoute: RouteManager.loginPage,
          onGenerateRoute: RouteManager.generateRoute,
        );
      },
    );
  }
}
