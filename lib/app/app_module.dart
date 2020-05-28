import 'package:incpacientes/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:incpacientes/app/app_widget.dart';
import 'package:incpacientes/app/modules/cadastro/cadastro_controller.dart';
import 'package:incpacientes/app/modules/cadastro/cadastro_page.dart';
import 'package:incpacientes/app/modules/home/home_controller.dart';
import 'package:incpacientes/app/modules/home/home_page.dart';
import 'package:incpacientes/app/modules/login/login_module.dart';
import 'package:incpacientes/app/shared/interfaces/shared_repository_interface.dart';
import 'package:incpacientes/app/shared/repositories/shared_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ISharedRepositoryInterface>((i) => SharedRepository()),
        Bind((i) => AppController()),
        Bind((i) => CadastroController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LoginModule()),
        Router('/cadastro', child: (_, args) => CadastroPage()),
        Router('/home', child: (_, args) => HomePage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
