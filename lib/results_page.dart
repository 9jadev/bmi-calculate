import 'package:bmi_calculator/Button_button.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusableCard.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: kTitleTextStyle,
              ),
            )
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeCardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle
                  ),
                  Text(
                    bmiResult,
                    style: kBmiTitleTextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ),
          ButtonButton(buttonTitle: 'RECALULATE', onTap: (){
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}