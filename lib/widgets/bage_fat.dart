import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class BageFat extends StatelessWidget {
  const BageFat({
    Key key,
    @required this.fontSize2,
    @required this.shapeSize,
    @required this.fatBox,
  }) : super(key: key);

  final double fontSize2;
  final double shapeSize;
  final Box fatBox;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              top: 15, bottom: 10, left: 10, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'ВЫШЕ НОРМЫ',
                style: TextStyle(
                    fontFamily: 'RubikL', fontSize: fontSize2),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0XFFFF8A80),
                    borderRadius:
                    BorderRadius.all(Radius.circular(30))),
                height: shapeSize,
                width: 105,
                child: Center(
                    child: Text(
                      '32 > %',
                      style: TextStyle(
                          fontSize: fontSize2, fontFamily: 'Rubik'),
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              bottom: 10, left: 10, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'СНОСНО',
                style: TextStyle(
                    fontFamily: 'RubikL', fontSize: fontSize2),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0XFFFFEB3B),
                    borderRadius:
                    BorderRadius.all(Radius.circular(30))),
                height: shapeSize,
                width: 105,
                child: Center(
                    child: Text(
                      '25 > 31%',
                      style: TextStyle(
                          fontSize: fontSize2, fontFamily: 'Rubik'),
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              bottom: 10, left: 10, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'НОРМА',
                style: TextStyle(
                    fontFamily: 'RubikL', fontSize: fontSize2),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0XFF00E676),
                    borderRadius:
                    BorderRadius.all(Radius.circular(30))),
                height: shapeSize,
                width: 105,
                child: Center(
                    child: Text(
                      '21 > 24%',
                      style: TextStyle(
                          fontSize: fontSize2, fontFamily: 'Rubik'),
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              bottom: 10, left: 10, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'ФИТНЕС',
                style: TextStyle(
                    fontFamily: 'RubikL', fontSize: fontSize2),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0XFF76FF03),
                    borderRadius:
                    BorderRadius.all(Radius.circular(30))),
                height: shapeSize,
                width: 105,
                child: Center(
                    child: Text(
                      '14 > 20%',
                      style: TextStyle(
                          fontSize: fontSize2, fontFamily: 'Rubik'),
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              bottom: 10, left: 10, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'НИЖЕ НОРМЫ',
                style: TextStyle(
                    fontFamily: 'RubikL', fontSize: fontSize2),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0XFF81D4FA),
                    borderRadius:
                    BorderRadius.all(Radius.circular(30))),
                height: shapeSize,
                width: 105,
                child: Center(
                    child: Text(
                      '10 > 12%',
                      style: TextStyle(
                          fontSize: fontSize2, fontFamily: 'Rubik'),
                    )),
              )
            ],
          ),
        ),

      ],
    );
  }
}