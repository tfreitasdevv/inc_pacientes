import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:incpacientes/app/shared/constants.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primaryColor: vermelhoLogo,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
