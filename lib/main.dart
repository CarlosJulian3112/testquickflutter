import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testquickflutter/src/pages/comentarios_page.dart';
import 'package:testquickflutter/src/pages/home_page.dart';
import 'dart:async';

import 'package:testquickflutter/src/splash/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => SplashScreen(),
        'comentarios': (BuildContext context) => ComentariosPage(),
      },
    ),
  );
}
