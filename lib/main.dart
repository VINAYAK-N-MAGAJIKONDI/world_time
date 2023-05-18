import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/choose_location.dart';
import 'pages/loading.dart';

void main() => runApp(MaterialApp(

  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => home(),
    '/location': (context) => Chooselocation(),
  },
  theme: ThemeData(


  useMaterial3: true,
)

),

);

