import 'package:incpacientes/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:incpacientes/app/app_widget.dart';
import 'package:incpacientes/app/modules/login/login_module.dart';
import 'package:incpacientes/app/shared/interfaces/shared_repository_interface.dart';
import 'package:incpacientes/app/shared/repositories/shared_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ISharedRepositoryInterface>((i) => SharedRepository()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
