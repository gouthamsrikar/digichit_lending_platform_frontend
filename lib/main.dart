import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onemoney_hack/screens/dashboard.dart';
import 'package:onemoney_hack/screens/login_page.dart';
import 'package:onemoney_hack/ui_commons/equal_ui.dart';
import 'package:onemoney_hack/url_config_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UrlConfigManager.getInstance().asyncLoadConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          buttonColor: EColors.EQUAL_GREEN,
        ),
        fontFamily: GoogleFonts.redHatText().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Dashboard(),
    );
  }
}
