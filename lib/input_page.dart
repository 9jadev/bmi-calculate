import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resuableIcon.dart';
import 'reusableCard.dart';
import 'constants.dart';
import 'results_page.dart';
import 'Button_button.dart';
import 'Round_Icon_Button.dart';
import 'CalculatorBrain.dart';

enum Gender {male , female}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender; 
  int height = 180;
  int weight = 60;
  int age = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOLO BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? activeCardcolor : inactiveCardcolor,
                    cardChild: ReusableIcons(text: 'male', color: Color(0xFF8D8E98), icon: FontAwesomeIcons.mars),
                  )
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },  
                    colour: selectedGender == Gender.female ? activeCardcolor : inactiveCardcolor,
                    cardChild: ReusableIcons(text: 'Female', color: Color(0xFF8D8E98), icon: FontAwesomeIcons.venus),
                  )
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeCardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style:  kLabelTextStyle
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.toInt();
                      });
                    }
                    ),
                  )
                ],
              ),
            )
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WIEGHT',
                          style: kLabelTextStyle
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  weight--;
                                });
                              }
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              }
                            )
                          ],
                        )
                      ],
                    )
                  )
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardcolor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  age--;
                                });
                              }
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              }
                            ),
                          ],
                        )
                      ],
                    )
                  )
                ),
              ],
            ),
          ),
          ButtonButton(
            buttonTitle: "CALCULATE",
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.CalculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                )
              ));
            },
          )
        ],
      )
    );
  }
}


