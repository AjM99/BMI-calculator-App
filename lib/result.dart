import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/material.dart';
import 'Screen1.dart';
import 'refactors.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                "Result",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.only(top: 10),
            ),
          ),
          Expanded(
            flex: 10,
            child: card(
              colour: kActiveColor,
              cardInput: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Normal",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "18.3",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 80,
                    ),
                  ),
                  Text(
                    "your bmi is gg asdasf asf asfas fasf sfsaasd a  f",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          MyMainButton(
              myTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputPage()),
                );
              },
              buttonName: "Re-calculate")
        ],
      ),
    );
  }
}
