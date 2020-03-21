import 'package:elastica/chart/fat_model.dart';
import 'package:flutter/material.dart';
import 'package:elastica/chart/fat_chart.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ndialog/ndialog.dart';
import 'package:hive/hive.dart';
import 'package:elastica/fat_result.dart';
import 'package:provider/provider.dart';

import '../fat_count.dart';
import 'newwi.dart';

class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  final fb = Hive.box('fatBox3');
  final fatBox = Hive.box('fatBox3');

  @override
  Widget build(BuildContext context) {
    final stat = Provider.of<StatusMain>(context);

    List<FatModel> data = [for (var i = 0; i < fb.length; i++) fb.getAt(i)];

    final fontSizeTitle = MediaQuery.of(context).size.height / 38;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
      },
      child: Container(
//        key: ValueKey<bool>(progress),
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
                    icon: new Icon(MdiIcons.close, color: Color(0xFF5D5D5D)),
                    onPressed: () {
                      stat.statusFn();
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
                                  dialogStyle: DialogStyle(titleDivider: true),
                                  title: Icon(
                                    MdiIcons.information,
                                    color: Color(0xFF5D5D5D),
                                  ),
                                  content: Text(
                                    "Удалить последний результат измерения?",
                                    style: TextStyle(fontFamily: 'RubikR'),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        "ДА",
                                        style: TextStyle(fontFamily: 'RubikR'),
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
                                        style: TextStyle(fontFamily: 'RubikR'),
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
                                  dialogStyle: DialogStyle(titleDivider: true),
                                  title: Icon(MdiIcons.information,
                                      color: Color(0xFF5D5D5D)),
                                  content: Text(
                                    "Так вы можете удалить последний результат измерения",
                                    style: TextStyle(fontFamily: 'RubikR'),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        "ЗАКРЫТЬ",
                                        style: TextStyle(fontFamily: 'RubikR'),
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
                        padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
                        child: Text(
                          'Произведите первый замер',
                          style: TextStyle(
                              fontFamily: 'RubikR', fontSize: fontSizeTitle),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
