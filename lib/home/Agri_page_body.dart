import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_practice/home/page1.dart';

class AgriPageBody extends StatefulWidget {
  const AgriPageBody({Key? key}) : super(key: key);

  @override
  State<AgriPageBody> createState() => _AgriPageBodyState();
}

class _AgriPageBodyState extends State<AgriPageBody> {
  PageController pageController=PageController(viewportFraction: 0.85);
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
    return TextButton(
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
    );
  }
}
