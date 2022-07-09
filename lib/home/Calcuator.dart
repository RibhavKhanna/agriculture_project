import 'package:flutter/material.dart';
class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  var _controller1=TextEditingController();
  var _controller2=TextEditingController();
  double result=0.0;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF353e55),
          appBar: AppBar(
            backgroundColor: Colors.lightBlue[300],
            title: Text("Value Calculator",textDirection: TextDirection.ltr,),
            centerTitle: true,
            elevation: 0,
          ),
          body:  SingleChildScrollView(
            child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFF353e55),
                  ),
                  child: Column(
                    children: [

                      Card(
                        elevation: 10,

                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: EdgeInsets.all(15),
                        child: Container(
                          height: 100,

                          child: TextField(
                            controller: _controller1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(

                              prefix: Image.asset('assets/grow.gif',width: 70,height: 70,fit: BoxFit.contain,),
                              contentPadding: EdgeInsets.symmetric(vertical: 40.0,horizontal: 20),
                                hoverColor: Colors.grey,
                                border: OutlineInputBorder(
                                  // borderSide: BorderSide(width: 5,color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "Enter Produce in kg",
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2.0,
                                  color: Colors.blue[900],
                                ),

                            ),

                          ),
                        ),

                      ),
                      SizedBox(height: 20,),
                      Card(
                        elevation: 10,
                          shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: EdgeInsets.all(15),
                        child: Container(
                          height: 100,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _controller2,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.currency_rupee_rounded,color: Colors.blue,size: 30,),
                              contentPadding: EdgeInsets.symmetric(vertical: 40,horizontal: 20),
                              hoverColor: Colors.grey,
                              border: OutlineInputBorder(
                                // borderSide: BorderSide(width: 5,color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Enter cost per kg",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                letterSpacing: 2.0,
                                color: Colors.blue[900],
                              ),

                            ),

                          ),
                        ),

                      ),
                      SizedBox(height: 20,),
                      TextButton(
                          onPressed: (){
                            setState((){
                              double p=double.parse(_controller1.text);
                              double c=double.parse(_controller2.text);
                              result=p*c;
                              print(result);
                            });
                          },
                            child: Container(
                                width: 250,height:70,
                              padding: EdgeInsets.fromLTRB(55, 20, 20, 0),
                              decoration: BoxDecoration(
                                color: Colors.teal[800],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Calculate",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                      SizedBox(height: 20,),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Result :",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            SizedBox(height: 10,),
                            Text(
                              result.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.cyan[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                

            ),
          ),
        )
    );
  }
}
