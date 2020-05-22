import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        navigatorKey: Modular.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: Modular.get<AppController>().themeApp.getTheme(),
        title: 'INC Pacientes',
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
      );
    });
  }
}
