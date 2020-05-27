import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../shared/constants.dart';
import '../../shared/constants.dart';
import '../../shared/constants.dart';
import '../../shared/constants.dart';
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

  //Tamanhos
  double distanciaFormField = 10;

  //Máscaras
  final TextInputFormatter mascaraCelular = MaskTextInputFormatter(
      mask: '(##) # ####-####', filter: {'#': RegExp(r'[0-9]')});
  final TextInputFormatter mascaraData = MaskTextInputFormatter(
      mask: '##/##/####', filter: {'#': RegExp(r'[0-9]')});
  final TextInputFormatter mascaraCPF = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});

  //Keys
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //Controladores de texto
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nascimentoController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  String _sexoController;
  TextEditingController _nomeDaMaeController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _confirmaSenhaController = TextEditingController();
  TextEditingController _celularController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> itens = ['F', 'M'];
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: vermelhoLogoEscuro,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(bgSemBarra), fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: SingleChildScrollView(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //SizedBox(height: 6),
                          _divider("Dados Pessoais"),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _nomeController,
                            cursorColor: pretoLogoEscuro,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: pretoLogoEscuro, width: 2),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              labelText: "Nome Completo",
                              labelStyle: TextStyle(
                                  color: pretoLogoEscuro,
                                  fontSize:
                                      MediaQuery.of(context).size.width > 400
                                          ? 16
                                          : 14),
                            ),
                            style: TextStyle(fontSize: 18),
                            validator: (String valor) {
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            obscureText: false,
                          ),
                          SizedBox(height: distanciaFormField),
                          Row(
                            children: [
                              Expanded(
                                  flex: 60,
                                  child: TextFormField(
                                    inputFormatters: [mascaraData],
                                    controller: _nascimentoController,
                                    cursorColor: pretoLogoEscuro,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: pretoLogo, width: 1),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: pretoLogo, width: 1),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: pretoLogoEscuro, width: 2),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      labelText: "Nascimento",
                                      labelStyle: TextStyle(
                                          color: pretoLogoEscuro,
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  400
                                              ? 16
                                              : 14),
                                    ),
                                    style: TextStyle(fontSize: 18),
                                    validator: (String valor) {
                                      return null;
                                    },
                                    keyboardType: TextInputType.datetime,
                                    obscureText: false,
                                  )),
                              Expanded(flex: 5, child: Container(height: 10)),
                              Expanded(
                                  flex: 35,
                                  child: DropdownButtonFormField<String>(
                                    items: itens.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                          child: Text(value), value: value);
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _sexoController = value;
                                      });
                                    },
                                    style: TextStyle(color: pretoLogoEscuro),
                                    decoration: InputDecoration(
                                      filled: false,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: pretoLogo, width: 1),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: pretoLogo, width: 1),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: pretoLogoEscuro, width: 2),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      labelText: "Sexo",
                                      labelStyle: TextStyle(
                                          color: pretoLogoEscuro,
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  400
                                              ? 16
                                              : 14),
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(height: distanciaFormField),
                          TextFormField(
                            controller: _nomeDaMaeController,
                            cursorColor: pretoLogoEscuro,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: pretoLogoEscuro, width: 2),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              labelText: "Nome da Mãe",
                              labelStyle: TextStyle(
                                  color: pretoLogoEscuro,
                                  fontSize:
                                      MediaQuery.of(context).size.width > 400
                                          ? 16
                                          : 14),
                            ),
                            style: TextStyle(fontSize: 18),
                            validator: (String valor) {
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            obscureText: false,
                          ),
                          SizedBox(height: distanciaFormField),
                          TextFormField(
                            controller: _cpfController,
                            inputFormatters: [mascaraCPF],
                            cursorColor: pretoLogoEscuro,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: pretoLogoEscuro, width: 2),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              labelText: "CPF",
                              labelStyle: TextStyle(
                                  color: pretoLogoEscuro,
                                  fontSize:
                                      MediaQuery.of(context).size.width > 400
                                          ? 16
                                          : 14),
                            ),
                            style: TextStyle(fontSize: 18),
                            validator: (String valor) {
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            obscureText: false,
                          ),
                          SizedBox(height: 24),
                          _divider("Dados de Contato e Login"),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _celularController,
                            inputFormatters: [mascaraCelular],
                            cursorColor: pretoLogoEscuro,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: pretoLogoEscuro, width: 2),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              labelText: "Celular",
                              labelStyle: TextStyle(
                                  color: pretoLogoEscuro,
                                  fontSize:
                                      MediaQuery.of(context).size.width > 400
                                          ? 16
                                          : 14),
                            ),
                            style: TextStyle(fontSize: 18),
                            validator: (String valor) {
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            obscureText: false,
                          ),
                          SizedBox(height: distanciaFormField),
                          TextFormField(
                            controller: _emailController,
                            cursorColor: pretoLogoEscuro,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: pretoLogoEscuro, width: 2),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              labelText: "E-mail",
                              labelStyle: TextStyle(
                                  color: pretoLogoEscuro,
                                  fontSize:
                                      MediaQuery.of(context).size.width > 400
                                          ? 16
                                          : 14),
                            ),
                            style: TextStyle(fontSize: 18),
                            validator: (String valor) {
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                          ),
                          SizedBox(height: distanciaFormField),
                          TextFormField(
                            controller: _senhaController,
                            cursorColor: pretoLogoEscuro,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: pretoLogoEscuro, width: 2),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              labelText: "Senha",
                              labelStyle: TextStyle(
                                  color: pretoLogoEscuro,
                                  fontSize:
                                      MediaQuery.of(context).size.width > 400
                                          ? 16
                                          : 14),
                            ),
                            style: TextStyle(fontSize: 18),
                            validator: (String valor) {
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          SizedBox(height: distanciaFormField),
                          TextFormField(
                            controller: _confirmaSenhaController,
                            cursorColor: pretoLogoEscuro,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pretoLogo, width: 1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: pretoLogoEscuro, width: 2),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              labelText: "Confirmação da Senha",
                              labelStyle: TextStyle(
                                  color: pretoLogoEscuro,
                                  fontSize:
                                      MediaQuery.of(context).size.width > 400
                                          ? 16
                                          : 14),
                            ),
                            style: TextStyle(fontSize: 18),
                            validator: (String valor) {
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          SizedBox(height: 20),
                          RaisedButton(
                            onPressed: () {},
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                            color: vermelhoLogoEscuro,
                            elevation: 4,
                            child: Text(
                              'Cadastrar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                          ),
                          SizedBox(height: 8)
                        ],
                      ))),
            ),
          ],
        ));
  }

  Widget _divider(String texto) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(
            texto,
            style: TextStyle(fontSize: 12, color: pretoLogoClaro),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
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
