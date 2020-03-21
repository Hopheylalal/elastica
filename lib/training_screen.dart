import 'dart:async';

import 'package:elastica/training_screen_go.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const spinkit = SpinKitChasingDots(
  color: Color(0XFFC74DD4),
  size: 40.0,
);

class TrainingScreen extends StatefulWidget {
//  VideoPlayerController controller;

  final Map exercise;

  TrainingScreen(this.exercise);

  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  dynamic fontSize;

  void _showModalSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        context: context,
        builder: (builder) {
          return Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: Text(
                    'СПРАВКА',
                    style:
                        TextStyle(fontFamily: 'Rubik', fontSize: fontSize + 2),
                  ),
                ),
                Text(
                  'Это обзорный экран тренировки. Каждая тренировка включает в себя четыре разных упражнения, которые следует повторить 4 раза. Таким образом каждый тренировочный блок состоит из 16ти упражнений.',
                  style: TextStyle(fontFamily: 'RubikL', fontSize: fontSize),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
          );
        });
    Hive.box('firstTime').add(1);
  }

  bool firstTime = true;

  @override
  void initState() {
    if (Hive.box('firstTime').isEmpty) {
      Timer(Duration(seconds: 1), () {
        _showModalSheet();
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    controller = VideoPlayerController.asset('lib/assets/img/1.mp4');
//    controller.initialize();
//    controller.play();
//    controller.setLooping(true);

    final videoSize = MediaQuery.of(context).size.height / 2.2;
    final titleSize = MediaQuery.of(context).size.height / 45;
    final fontNameSize = MediaQuery.of(context).size.height / 38;

    fontSize = MediaQuery.of(context).size.height / 40;

    final List<PageViewModel> pages = [
      PageViewModel(
        titleWidget: Text(
          widget.exercise[1]['name'],
          style: TextStyle(
            fontFamily: 'RubikL',
            fontSize: fontNameSize,
          ),
        ),
        bodyWidget: Container(
          height: videoSize,
          child: CachedNetworkImage(
            imageUrl: widget.exercise[1]['path'],
            placeholder: (context, url) => spinkit,
            errorWidget: (context, url, error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Ошибка загрузки ролика...'),
                  RaisedButton(
                    child: Text('Обновить'),
                    onPressed: () {
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        footer: modalDescription(context, 1, 'descriprion'),
      ),
      PageViewModel(
        titleWidget: Text(
          widget.exercise[2]['name'],
          style: TextStyle(
            fontFamily: 'RubikL',
            fontSize: fontNameSize,
          ),
        ),
        bodyWidget: Container(
          height: videoSize,
          child: CachedNetworkImage(
            imageUrl: widget.exercise[2]['path'],
            placeholder: (context, url) => spinkit,
            errorWidget: (context, url, error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Ошибка загрузки ролика...'),
                  RaisedButton(
                    child: Text('Обновить'),
                    onPressed: () {
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        footer: modalDescription(context, 2, 'descriprion'),
      ),
      PageViewModel(
        titleWidget: Text(
          widget.exercise[3]['name'],
          style: TextStyle(
            fontFamily: 'RubikL',
            fontSize: fontNameSize,
          ),
        ),
        bodyWidget: Container(
          height: videoSize,
          child: CachedNetworkImage(
            imageUrl: widget.exercise[3]['path'],
            placeholder: (context, url) => spinkit,
            errorWidget: (context, url, error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Ошибка загрузки ролика...'),
                  RaisedButton(
                    child: Text('Обновить'),
                    onPressed: () {
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        footer: modalDescription(context, 3, 'descriprion'),
      ),
      PageViewModel(
        titleWidget: Text(
          widget.exercise[4]['name'],
          style: TextStyle(
            fontFamily: 'RubikL',
            fontSize: fontNameSize,
          ),
        ),
        bodyWidget: Container(
          height: videoSize,
          child: CachedNetworkImage(
            imageUrl: widget.exercise[4]['path'],
            placeholder: (context, url) => spinkit,
            errorWidget: (context, url, error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Ошибка загрузки ролика...'),
                  RaisedButton(
                    child: Text('Обновить'),
                    onPressed: () {
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        footer: modalDescription(context, 4, 'descriprion'),
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFFFF176),
      appBar: AppBar(
        actions: <Widget>[],
        leading: new IconButton(
          icon: new Icon(MdiIcons.chevronLeft, color: Color(0xFF5D5D5D)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.exercise['trainingNum'],
          style: TextStyle(
              color: Color(0xFF5D5D5D),
              fontFamily: 'Rubik',
              fontSize: titleSize),
        ),
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: IntroductionScreen(
            globalBackgroundColor: Colors.transparent,
            skipFlex: 0,
            dotsFlex: 1,
            showNextButton: false,
            pages: pages,
            onDone: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TrainingScreenGo(widget.exercise),
                ),
              );
            },
            showSkipButton: false,
            skip: const Text("Skip"),
            done: const Text(
              "НАЧАТЬ",
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14,
                color: Color(0xFF5D5D5D),
              ),
            ),
            dotsDecorator: DotsDecorator(
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
    );
  }

  IconButton modalDescription(BuildContext context, number, descriprion) {
    return IconButton(
      color: Color(0xFF5D5D5D),
      icon: Icon(MdiIcons.information),
      onPressed: () {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  // ignore: missing_return
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                  },
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: Icon(
                          MdiIcons.information,
                          color: Color(0xFF5D5D5D),
                        ),
                      ),
                      Text(
                        widget.exercise[number][descriprion],
                        style:
                            TextStyle(fontFamily: 'RubikL', fontSize: fontSize),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
