import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[200],
          title: Text("SOIL MOISTURE"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                height: 320,
                margin: EdgeInsets.only(left: 5,right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/img3.jpg")
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 400,
                  margin: EdgeInsets.only(left: 30,right: 30,bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5.0,spreadRadius: 5.0)],
                    color: Colors.white,


                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
