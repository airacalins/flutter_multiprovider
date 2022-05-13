// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_playground/models/settings_data.dart';
import 'package:flutter_playground/models/user.dart';
import 'package:flutter_playground/routes/routes.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building MainPage');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<SettingsData>().appBarColor,
        automaticallyImplyLeading: false,
        title: Consumer<User>(builder: ((context, value, child) {
          return Text('Hello! ${value.username}');
        })),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteManager.settingsPage);
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Consumer<User>(builder: ((context, value, child) {
              return Text(
                'Welcome, ${value.username}!',
                style: TextStyle(fontSize: 24),
              );
            })),
          ],
        ),
      ),
    );
  }
}
