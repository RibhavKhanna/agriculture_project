import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_practice/home/page1.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
class AgriPageBody extends StatefulWidget {
  const AgriPageBody({Key? key}) : super(key: key);

  @override
  State<AgriPageBody> createState() => _AgriPageBodyState();
}

class _AgriPageBodyState extends State<AgriPageBody> {
  PageController pageController=PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=220;

  var data_list1=[];
  var data_list2=[];
  var data_list3=[];
  int avg1=0;
  int avg2=0;
  int avg3=0;


  Future getSensorData() async{
    http.Response response=await http.get(Uri.parse('https://script.googleusercontent.com/macros/echo?user_content_key=srCOzIRjFPjezGa0FJtozDZDqmUDAqoGWp6wgZEUX5fbc89n_lBORswklKl5hdGJJbblO_87-QIpyuhMM3GccUMriX0kmwf8m5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnE8K225hnKl5PFZxItyTYhgJkRbxpUSpmDeUegO7ah5q3HUDy73uGNfM8MTqvc8lWD7BN3xrM8PPOjmqkxPtpwqpBfHoQsxc4w&lib=MXsDzm9Yz05Na2TaEooMXAhLPmd7L4iXl'));
    var result=jsonDecode(response.body);
    setState(() {
      for(var i in result){
        data_list1.add(i['FLAME']);
        data_list2.add(i['LIGHT']);
        data_list3.add(i['SOIL_MOISTURE']);
      }
      num total1 = 0;
      data_list1.forEach((item) => total1 += item);
      num total2 = 0;
      data_list2.forEach((item) => total2 += item);
      num total3 = 0;
      data_list3.forEach((item) => total3 += item);
      avg1=(total1/data_list1.length).round();
      avg2=(total2/data_list2.length).round();
      avg3=(total3/data_list3.length).round();
    });
  }

  @override
  void initState() {
    super.initState();
    this.getSensorData();
    pageController.addListener(() {
      setState(() {
        _currPageValue=pageController.page!;
      });

    });
  }
  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.redAccent,
      height: 320,
      child:PageView.builder(
        controller: pageController,
        itemCount: 5,
          itemBuilder: (context,position){
        return _buildPageItem(position);
      }) ,
    );
  }
  Widget _buildPageItem(int index){
    //important tranformation

    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index==_currPageValue.floor()+1){
      var currScale=_scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index==_currPageValue.floor()-1){
      var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale=0.8;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
    }
    Widget data2(int index){
       if(index==0){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            const Text(
              "FLAME SENSOR",
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              avg1.toString(),
              style: const TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),

          ],
        );
      }else if(index==1){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            const Text(
              "LIGHT SENSOR",
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              avg2.toString(),
              style: const TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),

          ],
        );
      }else if(index==2){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        children:[
        const Text(
          "SOIL MOISTURE SENSOR",
          style: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          fontSize: 20,
          ),
        ),
          const SizedBox(height: 10,),
        Text(
          avg3.toString(),
          style: const TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          fontSize: 20,
          ),
        ),

      ],
      );
      }else if(index==3){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:const [
            Text(
              "WHEAT",
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "INFORMATION",
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),

          ],
        );
      }else{
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:const [
            Text(
              "RICE",
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            Text(
              "INFORMATION",
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),

          ],
        );
      }
    }
    return Transform(
      transform: matrix,
      child: TextButton(
        onPressed: (){

          // dynamic page = Page${index;}();
          Navigator.pushNamed(context, '/page${index+1}');
          },
        child: Stack(
          children:[
          Container(
            height: 220,

            margin: EdgeInsets.only(left: 5,right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img${index+1}.jpg")
              ),
            ),
          ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 140,
                width: 400,
                margin: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 5.0,spreadRadius: 5.0)],
                  color: Colors.white,
                ),
                child:data2(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
