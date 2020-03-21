import 'package:elastica/assets/my_flutter_app_icons.dart';
import 'package:elastica/chart/fat_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../fat_count.dart';
import '../fat_result.dart';
import 'newwi.dart';

class MainProgress extends StatefulWidget {
  @override
  _MainProgressState createState() => _MainProgressState();
}

class _MainProgressState extends State<MainProgress> {
  final fatBox = Hive.box('fatBox3');

  bool progressM = false;

  final fb = Hive.box('fatBox3');
  @override
  Widget build(BuildContext context) {
    final stat = Provider.of<StatusMain>(context);

    List<FatModel> listfb = [for (var i = 0; i < fb.length; i++) fb.getAt(i)];

    final lastFatResult = listfb.length == 0 ? null : listfb.last;

    List<FatModel> data = [for (var i = 0; i < fb.length; i++) fb.getAt(i)];

    final fontSizeTitle = MediaQuery.of(context).size.height / 38;
    final iconSize = MediaQuery.of(context).size.height / 15;
    final fontSize = MediaQuery.of(context).size.height / 55;
    final iconSize2 = MediaQuery.of(context).size.height / 19;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 20),
          child: Text(
            'УРОВЕНЬ ЖИРОВОЙ ТКАНИ',
            style: TextStyle(
              fontSize: fontSizeTitle,
              fontFamily: 'Rubik',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        stat.statusFn();
                      },
                      child: Container(
                        child: Center(
                          child: Icon(
                            MyFlutterApp.chart,
                            size: iconSize,
                            color: Color(0XFFC9C9C9),
                          ),
                        ),
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'ПРОГРЕСС',
                      style: TextStyle(
                          fontFamily: 'RubikR',
                          fontSize: fontSize,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FatResultScreen(1),
                      ),
                    );
                  },
                  child: Container(
                    height: 130,
                    width: 130,
                    child: Card(
                      elevation: 1,
                      color: Color(0XFFC74DD4),
                      shape: StadiumBorder(
                        side: BorderSide(
                            color: Color(0xFFFFFFFF), width: 6),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: lastFatResult == null
                                    ? Text(
                                  '?',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontFamily: 'Rubik',
                                      color: Colors.white),
                                )
                                    : Text(
                                  lastFatResult.fatResult
                                      .toStringAsFixed(1),
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontFamily: 'Rubik',
                                      color: Colors.white),
                                )),
                            Text(
                              '%',
                              style: TextStyle(
                                  fontFamily: 'Rubik',
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FatCount(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          child: Icon(
                            MyFlutterApp.fat,
                            size: iconSize2,
                            color: Color(0XFFC9C9C9),
                          ),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Text(
                        'ЗАМЕРИТЬ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'RubikR',
                          fontSize: fontSize,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
