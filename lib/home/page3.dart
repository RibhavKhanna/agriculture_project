import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  dynamic l_value;
  Map data={};
  @override
  Widget build(BuildContext context) {
    try {
      data = data.isNotEmpty? data : ModalRoute
          .of(context)!
          .settings
          .arguments as Map<dynamic,
          dynamic>; //as pushReplacementNamed gives an object so we have to type cast it

      l_value=data['soil'];
      print(l_value);


      // print(data);
    }
    catch(e){
      data=data;
      l_value=0;

    }
    Widget Icon_select(){
      if(l_value>1100){
        return Icon(Icons.warning,color: Colors.red,size: 80,);
      }else{
        return Icon(Icons.thumb_up,color: Colors.green,size: 80);
      }
    }
    String Text_select(){
      if(l_value>1100){
        return "Light value is\n HIgh please \n check for a fire";
      }else{
        return "Everything is \nfine light value\n under control";
      }
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[200],
          title: Text("SOIL MOISTURE",textDirection: TextDirection.ltr,),
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
                  child: Column(
                    children: [
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
                                height: 100.0,
                                width: 100.0,
                                margin: const EdgeInsets.all(10.0),
                                padding: const EdgeInsets.all(5.0),
                                decoration:BoxDecoration(
                                  // color: Colors.greenAccent[400],
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 5.0)],
                                    image:DecorationImage(
                                      image: AssetImage('assets/flame.gif',),
                                      fit: BoxFit.cover,
                                    )
                                ),

                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text("data: ",textDirection: TextDirection.ltr,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25.0)),
                                  // Text("3 days",style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold,letterSpacing: 2.0,fontSize: 12.0)),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: const BoxDecoration(

                                        borderRadius: BorderRadius.all(Radius.circular(10))

                                    ),
                                    child: Center(
                                      child: Text(l_value.toString(),textDirection: TextDirection.ltr,style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold,fontSize: 35.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
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
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Container(
                                height: 100.0,
                                width: 100.0,
                                margin: const EdgeInsets.all(10.0),
                                padding: const EdgeInsets.all(5.0),
                                decoration:BoxDecoration(
                                  color: Colors.white,

                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 5.0)],
                                  // image:DecorationImage(
                                  //   image: AssetImage('assets/flame.gif',),
                                  //   fit: BoxFit.cover,
                                  // )
                                ),
                                child: Icon_select(),

                              ),
                              SizedBox(width: 20,),
                              Container(
                                child: Text(
                                    Text_select(),
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0
                                    )
                                ),
                              ),
                              // Text("3 days",style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold,letterSpacing: 2.0,fontSize: 12.0)),


                            ],
                          ),
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
