
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[200],
          title: Text("NOTIFICATIONS",textDirection: TextDirection.ltr,),
          centerTitle: true,
          elevation: 0,
        ),
        body:Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,10.0 , 10.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "वर्तमान कार्य",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.north_east_rounded),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,10.0 , 10.0, 10.0),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 5.0)],

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    Container(
                      height: 50.0,
                      width: 50.0,
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration:BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 5.0)],
                      ),
                      child: const Center(child: Text("2d due",textDirection: TextDirection.ltr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2.0,),)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("अनुसूचित छिड़काव नहीं किया गया था",textDirection: TextDirection.ltr,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0)),
                        const Text("आपके पास दो दिन की देरी है",textDirection: TextDirection.ltr,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0)),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(10))

                          ),
                          child: Text("मक्का #1",textDirection: TextDirection.ltr,style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold,fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,10.0 , 10.0, 10.0),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 5.0)],

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children:[
                    Container(
                      height: 50.0,
                      width: 50.0,
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration:BoxDecoration(
                        color: Colors.greenAccent[400],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 5.0)],
                      ),
                      child: const Center(child: Text("3d left",textDirection: TextDirection.ltr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2.0,),)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("3 दिनों में खेत में खाद डालना जरूरी",textDirection: TextDirection.ltr,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0)),
                        // Text("3 days",style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold,letterSpacing: 2.0,fontSize: 12.0)),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(10))

                          ),
                          child: Text("गेहूँ #1",textDirection: TextDirection.ltr,style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold,fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

          ],
        )
      ),
    );
  }
}
