import 'package:flutter/material.dart';
import 'package:tostada_regia/routes.dart';
import 'package:tostada_regia/ux/app_locations.dart';
import 'package:tostada_regia/ux/tostada_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/constants.dart';

class TostadaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false,
      theme:  tostadaTheme,
      supportedLocales: [const Locale('en', 'US')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],

      routes: routes,

    );
  }

}