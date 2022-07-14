import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/home/Agri_page_body.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_practice/widgets/big_text.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';



class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  var temp;
  var humidity;
  var description;
  var windspeed;
  var icon;
  var query = "Lucknow";
  var loc="Lucknow";
  var warning;
  final AgriPageBody obj=new AgriPageBody();

  Future getWeather(String location) async{
    var url=Uri.https('weatherapi-com.p.rapidapi.com', '/current.json',{
      "q": "$location"
    });
    http.Response response=await http.get(url,headers: {"X-RapidAPI-Key": "65ee82884emsh9efa67c67cd165bp1614d1jsn72969f217fe6",
      "X-RapidAPI-Host": "weatherapi-com.p.rapidapi.com",
      "useQueryString": "true"});
    var result=jsonDecode(response.body);

      setState(() {
        this.temp=result["current"]["temp_c"];
        this.description=result['current']['condition']['text'];
        this.humidity=result['current']['humidity'];
        this.windspeed=result['current']['wind_kph'];
        this.icon=result['current']['condition']['icon'];
        print(temp);

      });

    // }else{
    //   setState(() {
    //     this.warning=result['error']['message'];
    //   });
    // }

  }
  @override
  void initState() {
    super.initState();
    this.getWeather(loc);
  }

  _launchURL() async {
    try {
      const url = "https://www.kisaanhelpline.com/agriculture-news/Agriculture";

      await launchUrl(Uri.parse(url));

    }catch(e){
      print("could not open page please try again after some time");
    }
  }
  _launchspreedsheetURL() async {
    try {
      const url = "https://docs.google.com/spreadsheets/d/e/2PACX-1vTrA2yhCtP4HR1YEnEJm7779g_k8bZvSWGs96S2xOm-_nj1vOyTNgNAVkF56PqDSRMQ8gXYcdB8UhYZ/pubhtml";

      await launchUrl(Uri.parse(url));

    }catch(e){
      Exception("could not open page please try again after some time");
    }
  }



  @override
  Widget build(BuildContext context) {
   var _controller=TextEditingController();
    return Scaffold(
      drawer: Drawer(
        // backgroundColor: Colors.black,

        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF353e55),
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF353e55)),
                accountName: Text(
                  "Ribhav Khanna",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("ribhavkhanna@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "R",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate_outlined),
              title: const Text('Calculator'),
              onTap: () {
                Navigator.pushNamed(context, '/calculator');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text('Record'),
              onTap: () {
                Navigator.pushNamed(context, '/record');
              },
            ),
            ListTile(
              leading: const Icon(Icons.print_outlined),
              title: const Text('Print Spreedsheet'),
              onTap: () {

                _launchspreedsheetURL();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ), //Deawer
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          "एग्रीस्मार्ट   ",
          textDirection: TextDirection.ltr,

          style: TextStyle(
            fontSize: 30,
            color: Colors.teal,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,

          ),
        ),
        centerTitle: true,

        actions: [
          IconButton(onPressed: (){Navigator.pushNamed(context, '/notifications');}, icon: const Icon(Icons.notification_add_outlined),color: Colors.black,),
          // IconButton(onPressed: (){}, icon: const Icon(Icons.apps_rounded),color: Colors.black,),
          // IconButton(onPressed: (){}, icon: const Icon(Icons.person_outline),color: Colors.black,),

        ],

      ),
      body: Container(
        decoration: BoxDecoration(

          image: DecorationImage(
            // image: NetworkImage("http://imgur.com/gallery/Fkruevk"),
            image: AssetImage("assets/back.jpg"),
            fit: BoxFit.cover,

          ),
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(milliseconds: 1500));
            setState(() {
              // getWeather(loc);
              // this.build(context);
            });
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [

                AgriPageBody(),
                SizedBox(height: 10.0,),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(

                      hoverColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5,color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Enter a city",
                      hintText: "Enter a city",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2.0,
                        color: Colors.blue[900],
                      ),
                      helperText: warning,
                      suffix: IconButton(
                          onPressed: (){
                            setState(() {
                              query=_controller.text;
                              loc=query;
                              getWeather(loc);
                              print(temp);
                            });
                          },
                          icon: const Icon(Icons.search),
                      )
                    ),

                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.all(15.0),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.cyan[800],
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [BoxShadow(color: Colors.black26, spreadRadius: 10.0,blurRadius: 10.0 )],
                  ),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Currently in ${loc}",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        temp != null ? temp.toString().substring(0,4)+"\u00B0":"Loading",
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(icon != null ? "https:"+icon.toString():'https://gifimage.net/wp-content/uploads/2018/06/weather-gif-9.gif',width: 40,height: 40,),
                          Text(
                            description != null ? description.toString():"loading",
                            textDirection: TextDirection.ltr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        humidity != null ? "Humidity : "+humidity.toString()+"%":"Loading",
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        windspeed != null ? "Wind Speed : "+windspeed.toString()+"kmph":"Loading",
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.all(15.0),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [BoxShadow(color: Colors.black26, spreadRadius: 10.0,blurRadius: 10.0 )],
                  ),
                 child: Image.network('https://ml1ebgplijrs.i.optimole.com/tjzdPU8-idTJUQjg/w:auto/h:auto/q:auto/https://satyukt.com/wp-content/uploads/2021/01/soil_moisture_20201128.png'),

                )
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:IconButton(onPressed: _launchURL, icon:  Icon(Icons.near_me_rounded)),
            label: 'NEWS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );

  }
}

