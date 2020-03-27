import 'package:elastica/chart/fat_model.dart';
import 'package:elastica/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'home_screen.dart';
import 'widgets/bage_fat.dart';

class FatResultScreen extends StatefulWidget {
  final double bodyFat;

  FatResultScreen(this.bodyFat);

  @override
  _FatResultScreenState createState() => _FatResultScreenState();
}

class _FatResultScreenState extends State<FatResultScreen> {
  final fatBox = Hive.box('fatBox3');
  final win = Hive.box('ageHive');

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.height / 55;
    final fontSize2 = MediaQuery.of(context).size.height / 40;
    final fontSizeTitle = MediaQuery.of(context).size.height / 38;
    final fatFont = MediaQuery.of(context).size.height / 12;
    final shapeSize = MediaQuery.of(context).size.height / 15;
    final buttonSize = MediaQuery.of(context).size.height / 3;

    List<FatModel> listfbResult = [
      for (var i = 0; i < fatBox.length; i++) fatBox.getAt(i)
    ];

    final lastFatResult = listfbResult.length == 0 ? null : listfbResult.last;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xFFFFF176),
        body: SafeArea(
          bottom: false,
          child: Container(
            margin: EdgeInsets.only(bottom: 10, left: 10,right: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'РЕЗУЛЬТАТ ИЗМЕРЕНИЯ',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: fontSizeTitle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Color(0XFFF5F6F9),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Ваш уровень подкожной жировой ткани составляет:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: fontSize, fontFamily: 'RubikL'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: lastFatResult == null
                                    ? Text(
                                        'ПРОИЗВЕДИТЕ ЗАМЕР',
                                        style: TextStyle(
                                          fontSize: fontSizeTitle,
                                          fontFamily: 'Rubik',
                                        ),
                                      )
                                    : Text(
                                        lastFatResult.fatResult.toString(),
                                        style: TextStyle(
                                            fontSize: fatFont,
                                            fontFamily: 'Rubik'),
                                      ),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'RubikR'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BageFat(
                    fontSize2: fontSize2, shapeSize: shapeSize, fatBox: fatBox),
                SizedBox(
                  height: fontSize,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ButtonTheme(
                    minWidth: buttonSize,
                    height: 45,
                    child: RaisedButton(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      color: Color(0XFFC74DD4),
                      child: Text(
                        'ГОТОВО',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'RubikR'),
                      ),
                      onPressed: () async {
//                      win.clear();
                        print(win.length);
//                      Navigator.of(context).push(
//                        MaterialPageRoute(
//                          builder: (context) => OnBoardingScreen(),
//                        ),
//                      );

                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
