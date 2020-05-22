import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:incpacientes/app/shared/constants.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    bool web = kIsWeb;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIOverlays(
        web == false ? [SystemUiOverlay.bottom, SystemUiOverlay.top] : []);
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    bool web = kIsWeb;

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: cinzaBG,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(barraSuperior1),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: vermelhoLogo,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                  hintText: "E-mail",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32))),
                            ),
                            SizedBox(height: 12),
                            TextFormField(
                              controller: _senhaController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: vermelhoLogo,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                  hintText: "Senha",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32))),
                            )
                          ],
                        )),
                  ),
                ))
          ],
        ));
  }
}
