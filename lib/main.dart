import 'package:flutter/material.dart';

import 'package:major_project/Login.dart';

import 'package:major_project/theme_provider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 static const String title=
     "Light & Dark Theme";

  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider(create: (context) => ThemeProvider(),builder:(context,_)
 {
 final themeProvider = Provider.of<ThemeProvider>(context);
 return MaterialApp(
 themeMode: themeProvider.themeMode,
 theme:MyThemes.lightTheme,
 darkTheme: MyThemes.darkTheme,
 title: 'Major App',
 home: const Login(),
 );
 });
}