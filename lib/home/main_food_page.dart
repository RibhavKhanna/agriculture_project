import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_practice/home/Agri_page_body.dart';
// import 'package:flutter_practice/widgets/big_text.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'colors.dart';
class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  var temp;
  var humidity;
  var currently;
  var description;
  var windspeed;
  var icon;

  Future getWeather() async{
    http.Response response=await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=26.8465108&lon=80.9466832&appid=9170560f53313b59e4a2e6fa2cebd087'));
    var result=jsonDecode(response.body);
    setState(() {
      this.temp=result['main']['temp'];
      this.description=result['weather'][0]['description'];
      this.currently=result['weather'][0]['main'];
      this.humidity=result['main']['humidity'];
      this.windspeed=result['wind']['speed'];
      this.icon=result['weather'][0]['icon'];
      temp=temp-273;
      print(temp);
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "स्मार्ट ऐग्रकल्चर ",
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        actions: [
          IconButton(onPressed: (){Navigator.pushNamed(context, '/notifications');}, icon: const Icon(Icons.notification_add_outlined),color: Colors.black,),
          IconButton(onPressed: (){}, icon: const Icon(Icons.apps_rounded),color: Colors.black,),
          IconButton(onPressed: (){}, icon: const Icon(Icons.person_outline),color: Colors.black,),

        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            AgriPageBody(),
            SizedBox(height: 30.0,),
            Container(
              padding: const EdgeInsets.all(15.0),
              margin: const EdgeInsets.all(15.0),
              // color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [BoxShadow(color: Colors.black26, spreadRadius: 10.0,blurRadius: 10.0 )],
              ),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Currently in Lucknow",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    temp != null ? temp.toString().substring(0,4)+"\u00B0":"Loading",
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  // Text(
                  //   currently != null ? currently.toString():"Loading",
                  //   style: const TextStyle(
                  //     color: Colors.teal,
                  //     fontSize: 17.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_rounded,color: Colors.grey,),
                      Text(
                        description != null ? description.toString():"loading",
                        style: const TextStyle(
                          color: Colors.teal,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                  Text(
                    humidity != null ? "Humidity : "+humidity.toString():"Loading",
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Text(
                    windspeed != null ? "Wind Speed : "+windspeed.toString():"Loading",
                    style: const TextStyle(
                      color: Colors.teal,
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.near_me_rounded),
            label: 'Today',
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
