import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/constants.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
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
    double alturaStatus = MediaQuery.of(context).padding.top;
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;

    bool web = kIsWeb;

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(24),
                height: alturaTela,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(bgSemBarra), fit: BoxFit.cover)),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(barraSuperior)),
              Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Container(
                      height: alturaTela * 0.28,
                    ),
                    _buildCorpoHome()
                  ],
                ),
              )
            ],
          ),
        ));
  }

  _buildCorpoHome() {
    double sizedBoxAltura = 12;
    return Container(
      // height: alturaTela*0.74,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          filled: false,
                          fillColor: vermelhoLogo,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          hintText: "E-mail",
                          hintStyle: TextStyle(color: pretoLogoEscuro),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32))),
                    ),
                    SizedBox(height: sizedBoxAltura),
                    TextFormField(
                      controller: _senhaController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: false,
                          fillColor: vermelhoLogo,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          hintText: "Senha",
                          hintStyle: TextStyle(color: pretoLogoEscuro),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32))),
                    ),
                    SizedBox(height: sizedBoxAltura),
                    RaisedButton(
                      onPressed: () {},
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      color: vermelhoLogo,
                      elevation: 4,
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(color: pretoLogoClaro, fontSize: 14),
                        ),
                      ),
                    ),
                    _divider(),
                    RaisedButton(
                      onPressed: () {},
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      color: pretoLogoClaro,
                      elevation: 4,
                      child: Text(
                        'Entrar como visitante',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                    SizedBox(height: sizedBoxAltura),
                    FlatButton(
                        onPressed: () {},
                        child: Text("Novo no aplicativo? Crie aqui sua conta!"))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
              ),
            ),
          ),
          Text('ou'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
