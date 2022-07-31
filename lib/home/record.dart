import 'package:flutter/material.dart';
import 'package:flutter_practice/widgets/RecordData.dart';
import 'package:flutter_practice/widgets/sheet1.dart';
class Record extends StatefulWidget {
  const Record({Key? key}) : super(key: key);

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  var _controller1=TextEditingController();
  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("January"),value: "January"),
      DropdownMenuItem(child: Text("February"),value: "February"),
      DropdownMenuItem(child: Text("March"),value: "March"),
      DropdownMenuItem(child: Text("April"),value: "April"),
      DropdownMenuItem(child: Text("May"),value: "May"),
      DropdownMenuItem(child: Text("June"),value: "June"),
      DropdownMenuItem(child: Text("July"),value: "July"),
      DropdownMenuItem(child: Text("August"),value: "August"),
      DropdownMenuItem(child: Text("September"),value: "September"),
      DropdownMenuItem(child: Text("October"),value: "October"),
      DropdownMenuItem(child: Text("November"),value: "November"),
      DropdownMenuItem(child: Text("December"),value: "December"),

    ];
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownItems2{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Wheat"),value: "Wheat"),
      DropdownMenuItem(child: Text("Rice"),value: "Rice"),
      DropdownMenuItem(child: Text("Barley"),value: "Barley"),
      DropdownMenuItem(child: Text("Corn"),value: "Corn"),
      DropdownMenuItem(child: Text("Sugarcane"),value: "Sugarcane"),


    ];
    return menuItems;
  }
  String selectedValue = "January";
  String selectedValue2 = "Wheat";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: Text("Records",textDirection: TextDirection.ltr,),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "Select Month",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5,),
              Center(
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 400,
                  child: DropdownButtonFormField(
                      // style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      decoration: InputDecoration(

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.blueAccent,
                      ),
                      dropdownColor: Colors.white,
                      value: selectedValue,
                      onChanged: (String? newValue){
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "Select Crop",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5,),
              Center(
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 400,
                  child: DropdownButtonFormField(
                    // style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.blueAccent,
                      ),
                      dropdownColor: Colors.white,
                      value: selectedValue2,
                      onChanged: (String? newValue){
                        setState(() {
                          selectedValue2 = newValue!;
                        });
                      },
                      items: dropdownItems2,
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
              TextButton(

                onPressed: () async{
                  // double p=double.parse(_controller1.text);

                  final user={
                    UserFields.produce: _controller1.text,
                  UserFields.month: selectedValue,
                    UserFields.crop:selectedValue2,
                  };
                  await UserSheetApi.insert([user]);
                },
                child: Container(
                  width: 250,height:70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.teal[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Save",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
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
