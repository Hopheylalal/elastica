import 'package:elastica/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'common/db_citat.dart';

class WinScreen extends StatelessWidget {

  String citat = Citat().rndCit();


  @override

  Widget build(BuildContext context) {
    final fontSizeTitle = MediaQuery.of(context).size.height / 38;
    final fontSize = MediaQuery.of(context).size.height / 40;
    final buttonSize = MediaQuery.of(context).size.height / 3;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFF176),
        body: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'ТРЕНИРОВКА ЗАВЕРШЕНА',
                  style:
                      TextStyle(fontFamily: 'Rubik', fontSize: fontSizeTitle),
                ),
                Image.asset('lib/assets/img/award.png'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    citat,
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
                ButtonTheme(
                  minWidth: buttonSize,
                  height: 45,
                  child: RaisedButton(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Color(0xFFC74DD4),
                    child: Text(
                      'ГОТОВО',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'RubikR'),
                    ),
                    onPressed: () async {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
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
