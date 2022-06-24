import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_practice/home/Agri_page_body.dart';
import 'package:flutter_practice/widgets/big_text.dart';
import 'package:flutter_practice/widgets/small_text.dart';
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
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 25.0,bottom: 15),
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                     BigText(text: "India",color: AppColors.mainColor,size: 30,),
                     Row(
                       children: [
                         SmallText(text: "amritsar",color: Colors.black54,),
                         Icon(Icons.arrow_drop_down_rounded),
                       ],
                     )
                    ],
                  ),
                  Center(
                    child: Container(
                      width:45,
                      height:45,
                      child: Icon(Icons.search,color: Colors.white,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AgriPageBody(),
          SizedBox(height: 30.0,),
          Container(
            padding: const EdgeInsets.all(15.0),
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
                Text(
                  currently != null ? currently.toString():"Loading",
                  style: const TextStyle(
                    color: Colors.teal,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  description != null ? description.toString()+" "+"&${icon.toString()}":"loading",
                  style: const TextStyle(
                    color: Colors.teal,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
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
          )
        ],
      ),
    );
  }
}
