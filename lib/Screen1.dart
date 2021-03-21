// this is  where we take user input then we switch to next screen to show result
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeColor = Color(0xff0A0E21);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = Colors.blueGrey[800];
  Color femaleCardColor = Colors.blueGrey[800];

  //1=male , 2=female
  void updateGenderColor(int gender) {
    // male pressed
    if (gender == 1) {
      if (maleCardColor == Colors.blueGrey[800]) {
        maleCardColor = activeColor;
        femaleCardColor = Colors.blueGrey[800];
      } else {
        maleCardColor = Colors.blueGrey[800];
      }
    }
    // female pressed
    if (gender == 2) {
      if (femaleCardColor == Colors.blueGrey[800]) {
        femaleCardColor = activeColor;
        maleCardColor = Colors.blueGrey[800];
      } else {
        femaleCardColor = Colors.blueGrey[800];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            //male and Female cards
            child: Row(children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateGenderColor(1);
                    });
                  },
                  child: card(
                    colour: maleCardColor,
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
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff969AAD),
                          ),
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
                      updateGenderColor(2);
                    });
                  },
                  child: card(
                    colour: femaleCardColor,
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
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff969AAD),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: card(
              colour: activeColor,
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
