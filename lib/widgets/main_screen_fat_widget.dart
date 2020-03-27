import 'package:elastica/assets/my_flutter_app_icons.dart';
import 'package:elastica/chart/fat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elastica/chart/fat_chart.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:elastica/fat_result.dart';
import 'package:ndialog/ndialog.dart';

import '../fat_count.dart';
import '../fat_result.dart';

class FatWidget extends StatefulWidget {
  @override
  _FatWidgetState createState() => _FatWidgetState();
}

class _FatWidgetState extends State<FatWidget> {
  final fatBox = Hive.box('fatBox3');

  bool progress = false;

  final fb = Hive.box('fatBox3');

  @override
  Widget build(BuildContext context) {
    List<FatModel> listfb = [for (var i = 0; i < fb.length; i++) fb.getAt(i)];

    final lastFatResult = listfb.length == 0 ? null : listfb.last;

    List<FatModel> data = [for (var i = 0; i < fb.length; i++) fb.getAt(i)];

    final iconSize = MediaQuery.of(context).size.height / 15;
    final iconSize2 = MediaQuery.of(context).size.height / 19;
    final fontSize = MediaQuery.of(context).size.height / 55;
    final fontSizeTitle = MediaQuery.of(context).size.height / 38;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      transitionBuilder:
          (Widget child, Animation<double> animation) {
        return ScaleTransition(
            child: child, scale: animation);
      },
      child: Card(
        key: ValueKey<bool>(progress),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30)),
        ),
        child: progress == false
            ? SafeArea(
              child: Column(
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
                              setState(() {
                                print(progress);
                                progress = true;
                                print(progress);
                              });
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
        ),
            )
            : AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: Container(
            key: ValueKey<bool>(progress),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: new Icon(MdiIcons.close,
                            color: Color(0xFF5D5D5D)),
                        onPressed: () {
                          setState(() {
                            progress = false;
                          });
                        },
                      ),
                      Text(
                        'ВАШ ПРОГРЕСС',
                        style: TextStyle(
                          fontSize: fontSizeTitle,
                          fontFamily: 'Rubik',
                        ),
                      ),
                      IconButton(
                        icon: new Icon(
                          MdiIcons.delete,
                          color: Colors.pink,
                        ),
                        onPressed: () {
                          fb.isNotEmpty
                              ? showDialog(
                              context: context,
                              builder: (context) {
                                return NAlertDialog(
                                  dialogStyle:
                                  DialogStyle(titleDivider: true),
                                  title: Icon(
                                    MdiIcons.information,
                                    color: Color(0xFF5D5D5D),
                                  ),
                                  content: Text(
                                    "Удалить последний результат измерения?",
                                    style:
                                    TextStyle(fontFamily: 'RubikR'),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        "ДА",
                                        style: TextStyle(
                                            fontFamily: 'RubikR'),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          fb.deleteAt(fb.length - 1);
                                          Navigator.pop(context);
                                        });
                                      },
                                    ),
                                    FlatButton(
                                      child: Text(
                                        "НЕТ",
                                        style: TextStyle(
                                            fontFamily: 'RubikR'),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              })
                              : showDialog(
                              context: context,
                              builder: (context) {
                                return NAlertDialog(
                                  dialogStyle:
                                  DialogStyle(titleDivider: true),
                                  title: Icon(MdiIcons.information,
                                      color: Color(0xFF5D5D5D)),
                                  content: Text(
                                    "Так вы можете удалить последний результат измерения",
                                    style:
                                    TextStyle(fontFamily: 'RubikR'),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        "ЗАКРЫТЬ",
                                        style: TextStyle(
                                            fontFamily: 'RubikR'),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.pop(context);
                                        });
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
                fatBox.isNotEmpty
                    ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: FatChart(
                      data: data,
                    ),
                  ),
                )
                    : InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FatCount(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 1,
                    color: Color(0XFFF5F6F9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.fromLTRB(20, 40, 20, 40),
                      child: Text(
                        'Произведите первый замер',
                        style: TextStyle(
                            fontFamily: 'RubikR',
                            fontSize: fontSizeTitle),
                      ),
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
