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
    double alturaTela = MediaQuery.of(context).size.height;

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
                        onPressed: () {
                          //Modular.to.pushNamed('/cadastro');
                          _dialogoCadastrar();
                        },
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

  _dialogoCadastrar() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              scrollable: true,
              titleTextStyle: TextStyle(
                  color: pretoLogoEscuro,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width > 400 ? 20 : 18),
              elevation: 8,
              contentTextStyle: TextStyle(
                  color: pretoLogoEscuro,
                  fontSize: MediaQuery.of(context).size.width > 400 ? 16 : 14),
              actions: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                      elevation: 4,
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      color: vermelhoLogo,
                      onPressed: () {
                        Navigator.of(context).pop();
                        Modular.to.pushNamed('/cadastro');
                      },
                      child: Text(
                        "PROSSEGUIR COM CADASTRO",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                      elevation: 4,
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      color: pretoLogoClaro,
                      onPressed: () {
                        //Modular.to.pushReplacementNamed('/signup');
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "ACESSAR COMO VISITANTE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "VOLTAR",
                        style: TextStyle(
                            color: pretoLogoClaro, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
              title: Text("AVISO IMPORTANTE", textAlign: TextAlign.center),
              content: Text(
                "Antes de prosseguir, é importante que você saiba que somente pacientes com prontuário no INC terão acesso à realização do cadastro.\n\nCaso você não seja um paciente do INC, fique à vontade para navegar em nosso Aplicativo como Visitante!",
                textAlign: TextAlign.justify,
              ),
            ),
          );
        });
  }
}
