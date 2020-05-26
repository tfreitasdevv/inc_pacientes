import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:incpacientes/app/shared/interfaces/theme_app_interface.dart';

import '../constants.dart';
import '../constants.dart';

class AppThemeLight implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData.light()
        .copyWith(primaryColor: vermelhoLogo, accentColor: pretoLogo);
  }
}
