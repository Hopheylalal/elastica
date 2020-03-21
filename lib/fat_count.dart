import 'dart:async';

import 'package:elastica/chart/fat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'common/db_fat_count.dart';
import 'fat_result.dart';
import 'package:hive/hive.dart';
import 'chart/fat_model.dart';
import 'package:video_player/video_player.dart';
import 'package:intl/intl.dart';
import 'dart:math' show pow;
import 'package:hive/hive.dart';


//
//decoration: BoxDecoration(
//color: Color(0XFFF5F6F9),
//borderRadius: BorderRadius.all(Radius.circular(20))),
//padding: EdgeInsets.all(20),

class FatCount extends StatefulWidget {
  @override
  _FatCountState createState() => _FatCountState();
}

class _FatCountState extends State<FatCount> {
  VideoPlayerController videoPlayerController;

  var timestamp = DateTime.now();

  double bodyFat;


  

  var fontSize;

  int numberScreen = 0;

  int fat_1 = 0;

  List fatSumList = [];

  final age = Hive.box('ageHive');

  void addFatRate(FatModel fatRate) {
    Hive.box('fatBox3').add(fatRate);
  }

  num roundTo(num x, int n) => (x * pow(10, n)).roundToDouble() / pow(10, n);

  void videoFn() {
    videoPlayerController =
        VideoPlayerController.asset(Fat.fatCountSet[numberScreen]['video']);
    videoPlayerController.initialize();

    videoPlayerController.setLooping(true);
  }

  void videoFn1() {
    videoPlayerController.dispose();
    videoPlayerController =
        VideoPlayerController.asset(Fat.fatCountSet[numberScreen + 1]['video']);
    videoPlayerController.initialize();
//    videoPlayerController.play();
//    videoPlayerController.setVolume(0);
    videoPlayerController.setLooping(true);
  }

  @override
  void initState() {
    videoFn();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  Color sliderColor = Color(0XFFC74DD4);

  void timerChangeColorSlider() {
    Timer(Duration(milliseconds: 220), () {
      print('hi');
      setState(() {
        sliderColor = Color(0XFFC74DD4);
      });
    });
  }

  @override
  Widget build(BuildContext context) {


//    double age1 = double.parse(age);

    final titleSize = MediaQuery.of(context).size.height / 45;
    fontSize = MediaQuery.of(context).size.height / 40;
    final picSize = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFFF176),
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
              ),
              color: Color(0XFFC74DD4),
              child: numberScreen <= 5
                  ? Text(
                      'ДАЛЕЕ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'RubikL'),
                    )
                  : Text(
                      'ГОТОВО',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'RubikL'),
                    ),
              onPressed: () {
                print(fat_1);
                setState(() {
                  if (fat_1 < 1) {
                    print('oh');
                    sliderColor = Colors.yellow;
                    timerChangeColorSlider();
                  } else {
                    if (numberScreen <= 5) {
                      videoFn1();
                      fatSumList.add(fat_1);
                      numberScreen++;
                      fat_1 = 0;
                      print(fatSumList.reduce((a, b) => a + b));
                    } else {
                      int sum = fatSumList.reduce((a, b) => a + b) + fat_1;
                      bodyFat = 495 /
                              (1.097 -
                                  (0.00046971 * sum) +
                                  (0.00000056 * sum * sum) -
                                  (0.00012828 * age.get('age'))) -
                          450;
                      final newFatRate = FatModel(
                          date: timestamp, fatResult: roundTo(bodyFat, 1));
                      addFatRate(newFatRate);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FatResultScreen(bodyFat),
                        ),
                      );
                    }
                  }
                });
              },
            ),
          )
        ],
        leading: new IconButton(
          icon: new Icon(MdiIcons.chevronLeft, color: Color(0xFF5D5D5D)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          Fat.fatCountSet[numberScreen]['appBar'],
          style: TextStyle(
              color: Color(0xFF5D5D5D),
              fontFamily: 'Rubik',
              fontSize: titleSize),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(child: child, scale: animation);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          key: ValueKey<int>(numberScreen),
          margin: EdgeInsets.all(10),
//          decoration: BoxDecoration(
//            color: Colors.white,
//            borderRadius: BorderRadius.all(
//              Radius.circular(20),
//            ),
//          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                Fat.fatCountSet[numberScreen]['pic'],
              ),
              modalDescription(context, 1, 'description'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  Fat.fatCountSet[numberScreen]['description'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    fat_1.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Rubik',
                    ),
                  ),
                  Text(
                    'мм',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Slider(
                  value: fat_1.toDouble(),
                  min: 0,
                  max: 70,
                  activeColor: sliderColor,
                  inactiveColor: Color(0xFFC9C9C9),
                  onChanged: (double newValue) {
                    setState(() {
                      fat_1 = newValue.round();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  child: DotsIndicator(
                    dotsCount: Fat.fatCountSet.length,
                    position: numberScreen.toDouble(),
                    decorator: DotsDecorator(
                      size: const Size.square(5.0),
                      activeSize: const Size(10.0, 5.0),
                      activeColor: Color(0XFFC74DD4),
                      color: Color(0xFF5D5D5D),
                      spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconButton modalDescription(BuildContext context, number, description) {
    return IconButton(
      color: Color(0xFF5D5D5D),
      icon: Icon(
        MdiIcons.video,
        size: 30,
      ),
      onPressed: () {
        videoPlayerController.play();
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          context: context,
          builder: (context) => FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.5,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Icon(
                    MdiIcons.information,
                    color: Color(0xFF5D5D5D),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: videoPlayerController.value.initialized
                          ? AspectRatio(
                              aspectRatio:
                                  videoPlayerController.value.aspectRatio,
                              child: VideoPlayer(videoPlayerController),
                            )
                          : Container(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ).whenComplete(() {
          videoPlayerController.pause();
        });
      },
    );
  }
}
