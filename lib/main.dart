import 'package:covid_in/core/presentation/router.dart';
import 'package:covid_in/core/presentation/screen_enum.dart';
import 'package:covid_in/core/presentation/theme/custom_app_theme.dart';
import 'package:flutter/material.dart';

import 'injection_container.dart' as di;

const USE_FAKE_API_IMPLEMENTATION = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: customMaterialTheme,
      onGenerateRoute: Router.generateRoute,
      initialRoute: Screen.home.toString(),
    );
  }
}