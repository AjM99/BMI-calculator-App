// this is  where we take user input then we switch to next screen to show result,screen1
import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants.dart';

// all constants are moved ro Constant.dart file
enum Genders {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //this is for ternary operator,these are properties
  Genders genderColor;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //left to right
        crossAxisAlignment: CrossAxisAlignment.stretch, //top to bottom
        children: <Widget>[
          //male and Female cards
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      genderColor = Genders.male;
                    });
                  },
                  child: card(
                    colour: genderColor == Genders.male
                        ? kActiveColor
                        : Colors.blueGrey[800],
                    cardInput: Column(
                      //to bring everything inside card at center
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 90,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Male",
                          //labelStyle is in Constant
                          style: kLabelStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      genderColor = Genders.female;
                    });
                  },
                  child: card(
                    colour: genderColor == Genders.female
                        ? kActiveColor
                        : Colors.blueGrey[800],
                    cardInput: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 90,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Female",
                          //labelStyle is in Constant
                          style: kLabelStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
          //height and scroll bar
          Expanded(
            child: card(
              colour: kActiveColor,
              cardInput: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Height",
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //this is to make cm and number come of one line/base
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        //we make this os that the value changes when we slide
                        height.toString(),
                        style: kLabelStyle2,
                      ),
                      Text(
                        "cm",
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.blueGrey[800],
                    onChanged: (double newValue) {
                      setState(() {
                        print(newValue);
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: card(
                  colour: Color(0xff0A0E21),
                ),
              ),
              Expanded(
                child: card(
                  colour: Color(0xff0A0E21),
                ),
              ),
            ]),
          ),
          //button
          Container(
            height: 60,
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 10),
            decoration: BoxDecoration(
              color: Color(0xff64FFDA),
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }
}

// no need to think har d on this class its just refactor done using flutter outline-> remove widget
class card extends StatelessWidget {
  //after creating a const card, to make changes in it we make this constructor
  card({this.cardInput, this.colour});

  final Widget cardInput;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardInput,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
