import 'package:flutter/material.dart';
import 'package:p2_bmi_calculator/constants/app_constants.dart';
import 'package:p2_bmi_calculator/widgets/left_bar.dart';
import 'package:p2_bmi_calculator/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double _bmiResult = 0;
  var _textResult = '';

  void _calculate() {
    final h = double.parse(_heightController.text);
    final w = double.parse(_weightController.text);

    setState(() {
      _bmiResult = w / (h * h);

      if (_bmiResult > 25)
        _textResult = "You\'re over weight";
      else if (_bmiResult > 18)
        _textResult = "You have normal weight";
      else
        _textResult = "You\'re under weight";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(
              color: accentHexColor,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: _calculate,
              child: Text(
                "Calculate",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.w400,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            //left side
            SizedBox(height: 20),
            LeftBar(barWidth: 40),
            SizedBox(height: 20),
            LeftBar(barWidth: 80),
            SizedBox(height: 20),
            LeftBar(barWidth: 50),

            //right side
            SizedBox(height: 20),
            RightBar(barWidth: 50),
            SizedBox(height: 60),
            RightBar(barWidth: 70),
          ],
        ),
      ),
      backgroundColor: mainHexColor,
    );
  }
}
