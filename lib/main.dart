import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PhoneNoscreen.dart';
import 'configSize.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraint)
      {
        return OrientationBuilder(
          builder: (context, orientation)
          {
            ConfigSize().init(constraint, orientation);
            return MaterialApp(
              title: 'One Click Chat',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepPurple,
                primaryColor: Colors.black,
                selectedRowColor:Color(0xfff4b228),
                textTheme: TextTheme(
                  headline1: TextStyle(fontSize: 2.76*ConfigSize.textMultiplier, fontWeight: FontWeight.bold,color: Color(0xff4a4b4D)),
                  headline2: TextStyle(fontSize:1.88*ConfigSize.textMultiplier,color: Color(0xff7c7d7e) ),
                  headline3: TextStyle(fontSize:2.51*ConfigSize.textMultiplier,color: Color(0xff4a4b4D),fontWeight: FontWeight.bold),
                  headline4: TextStyle(fontSize:1.75*ConfigSize.textMultiplier,color: Color(0xff4a4b4D),fontWeight: FontWeight.bold),
                ),
              ),


              home: PhoneOrEmail()
            );
          },
        );
      },

    );
  }
}