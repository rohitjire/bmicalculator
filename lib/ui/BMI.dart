import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BMIState();
  }
}

class BMIState extends State<BMI> {
  final TextEditingController _agecontroller = new TextEditingController();
  final TextEditingController _heightcontroller = new TextEditingController();
  final TextEditingController _weightcontroller = new TextEditingController();
  double cm =0.0;
  String bmi = " " ;
  double BMI;
  String message = "";

  void _calculateBMI(){
    setState(() {

      int age = int.parse(_agecontroller.text);
      double height = double.parse(_heightcontroller.text);
      cm = height * 30.48;
      double weight = double.parse(_weightcontroller.text);
      BMI = weight/(cm*cm)*10000;
      bmi = BMI.toStringAsFixed(2);
      if(double.parse(bmi) < 18.5)
        {
          message = "Underweight";
        }
      else if(18.5<double.parse(bmi)||double.parse(bmi) >24.9){
        message = "Normal Weight";
      }
      else if(25<double.parse(bmi)||double.parse(bmi)> 29.9){

        message = "Overweight";
      }
      else{
        if(double.parse(bmi) > 30)
        message = "Obesity";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        margin: const EdgeInsets.all(30),
        alignment: Alignment.topCenter,
        child: new ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset(
              "images/bmilogo.png",
              height: 100,
              width: 200
            ),
            new TextField(
              controller: _agecontroller,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                labelText: "Your Age",
                hintText: "eg:20",
                icon: new Icon(Icons.person_outline),
              ),
            ),
            new TextField(
              controller: _heightcontroller,
              keyboardType: TextInputType.numberWithOptions(signed: false),
              decoration: new InputDecoration(
                  labelText: "Height",
                  hintText: "In feet",
                  icon: new Icon(Icons.assessment)),
            ),
            new TextField(
              controller: _weightcontroller,
              keyboardType: TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              decoration: new InputDecoration(
                labelText: "Weight",
                hintText: 'In Kg',
                icon: new Icon(Icons.fastfood),
              ),
            ),
            new Padding(padding: new EdgeInsets.all(10)),
            new Container(
              child: new RaisedButton(
                color: Colors.pinkAccent,
                onPressed: _calculateBMI,
                child: new Text(
                  "Caluclate",
                ),
              ),
            ),
            new Padding(padding: EdgeInsets.all(10)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "$bmi",
                  style: new TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                new Text("$message",style:
                new TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                  fontStyle: FontStyle.italic,
                  color: Colors.pinkAccent
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
