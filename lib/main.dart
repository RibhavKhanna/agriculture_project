import 'package:flutter/material.dart';
import 'package:flutter_practice/home/Calcuator.dart';
import 'package:flutter_practice/home/main_food_page.dart';
import 'package:flutter_practice/home/page1.dart';
import 'package:flutter_practice/home/page2.dart';
import 'package:flutter_practice/home/page3.dart';
import 'package:flutter_practice/home/page4.dart';
import 'package:flutter_practice/home/page5.dart';
import 'package:flutter_practice/home/record.dart';
import 'package:flutter_practice/splash.dart';
import 'package:flutter_practice/widgets/RecordData.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/notifications.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetApi.init();

  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes:{
      '/':(context) => Splash(),
      'main_food_page':(context) =>MainFoodPage(),
      '/page1':(context) => Page1(),
      '/page2':(context) => Page2(),
      '/page3':(context) => Page3(),
      '/page4':(context) => Page4(),
      '/page5':(context) => Page5(),
      '/calculator':(context)=>Calculate(),
      '/notifications':(context) => Notifications(),
      '/record':(context) => Record(),

    },
    theme: ThemeData(

      textTheme: GoogleFonts.merriweatherTextTheme(),
    ),
  )
  );
}

