import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/constants.dart';
import 'cadastro_controller.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Cadastro"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
  //use 'controller' variable to access controller

  //Keys
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //Controladores de texto
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nascimentoController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _sexoController = TextEditingController();
  TextEditingController _nomeDaMaeController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _prontuarioController = TextEditingController();
  TextEditingController _aController = TextEditingController();
  TextEditingController _celularController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nomeController,
                        cursorColor: pretoLogoEscuro,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            labelText: "Nome completo",
                            labelStyle: TextStyle(color: pretoLogoEscuro)),
                        style: TextStyle(fontSize: 18),
                        validator: (String valor) {
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                      SizedBox(height: 14),
                      TextFormField(
                        controller: _emailController,
                        cursorColor: pretoLogoEscuro,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            labelText: "E-mail",
                            labelStyle: TextStyle(color: pretoLogoEscuro)),
                        style: TextStyle(fontSize: 18),
                        validator: (String valor) {
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      )
                    ],
                  ))),
        ));
  }
}
