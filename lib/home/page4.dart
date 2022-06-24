import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[200],
          title: Text("WHEAT"),
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
                      image: AssetImage("assets/wheat.jpg")
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(

                  margin: EdgeInsets.only(left: 30,right: 30,bottom: 20,top: 300),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 10.0,spreadRadius: 10.0)],
                    color: Colors.amber[200],


                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "RABI CROP",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        "MONTHS : FEBRUARY-MAY",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        "TEMPERATURE : Low Temp",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        "HUMIDITY : LOW",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        "ANNUAL RAINFALL : 50cm to 100cm",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        "PREFFERED SOIL TYPE :-",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        "  -FERTILE LLUVIAL SOIL",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        "  -MIXED SOIL",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        "  -LIGHT CLAYEY SOIL",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
