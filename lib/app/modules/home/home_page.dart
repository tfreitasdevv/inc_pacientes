import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:incpacientes/app/shared/constants.dart';
import 'package:incpacientes/app/shared/widgets/home_item_card.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(), drawer: _buildDrawer(), body: _buildBody());
  }

  Container _buildBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(bgSemBarra), fit: BoxFit.cover)),
      child: AnimationLimiter(
        child: GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
            itemCount: 14,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: Duration(milliseconds: 375),
                  columnCount: 2,
                  child: ScaleAnimation(
                      child: HomeItemCard(
                          titulo: "Teste", imagem: logoBranca, funcao: () {})));
            }),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("INC"),
      centerTitle: true,
      backgroundColor: vermelhoLogoEscuro,
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: pretoLogoClaro),
              currentAccountPicture: Image.asset(logoBranca),
              accountName: Text("Nome do Usuário"),
              accountEmail: Text("usuario@email.com"))
        ],
      ),
    );
  }
}
