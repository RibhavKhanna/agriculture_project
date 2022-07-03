import 'package:flutter/material.dart';

import 'home/main_food_page.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 2000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainFoodPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(

              decoration: BoxDecoration(
              color: Color(0xFF353e55),
              image: DecorationImage(
              image: AssetImage("assets/Agrismart.png"),
                // fit: BoxFit.fill,
            ),

          ),
        ),
      ),
    );
  }
}
