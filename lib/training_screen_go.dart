import 'dart:async';
import 'package:elastica/win_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:hive/hive.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wakelock/wakelock.dart';

class TrainingScreenGo extends StatefulWidget {
  final Map exercise;

  TrainingScreenGo(this.exercise);

  @override
  _TrainingScreenGoState createState() => _TrainingScreenGoState();
}

class _TrainingScreenGoState extends State<TrainingScreenGo>
    with WidgetsBindingObserver {
  AudioCache player = AudioCache(prefix: 'sounds/');

  void soundsPlay1() {
    player.play('sound2.mp3', volume: 0.5);
  }

  void soundsPlay2() {
    player.play('sound3.mp3', volume: 0.5);
  }

  void soundsReady() async {
    await player.play('ready.mp3');
  }

  void soundsPauseMin() async {
    await player.play('15m.mp3');
  }

  void soundsPauseMax() async {
    await player.play('60m.mp3');
  }

  int trainingList = 1;
  bool pauseStatus = false;

  Timer startTimer;
  int startTimerCount = 5;

  Timer workTimer;
  int workTime = 45;

  Timer pauseTimer;
  int pauseTime = 15;

  Timer bigPauseTimer;
  int bigPauseTime = 10;

//  void pauseResumeFn(){
//
//  }
  int pauseVisible = 1;

  void soundsSpeak() async {
    if (workTime == 44) {
      await player.play(widget.exercise[trainingList]['sounds'][1]);
    } else if (workTime == 35) {
      await player.play(widget.exercise[trainingList]['sounds'][2]);
    }
  }

  void startTimerFunk(int nowTime) {

    Wakelock.enable();
    startTimerCount = nowTime;
    startAfterPauseVar = 1;
    startTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        startTimerCount--;

        if (startTimerCount == 5) {
          soundsReady();
        }
        if (startTimerCount <= 3 && startTimerCount > 0) {
          soundsPlay1();
        } else if (startTimerCount == 0) {
          soundsPlay2();
        }
      });
      if (startTimerCount == 0) {
        timer.cancel();
        workTimerFn(workTime);
      }
    });
  }

  void workTimerFn(int nowTime) {
    pauseVisible = 2;
    workTime = nowTime;
    startAfterPauseVar = 2;
    pauseStatus = false;
    const oneSec = const Duration(seconds: 1);
    workTimer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          soundsSpeak();
          if (workTime == 1) {
            soundsPlay2();
          } else if (workTime < 6 && workTime > 1) {
            soundsPlay1();
          }
          if (workTime < 1) {
            timer.cancel();
            if (trainingList == 4 || trainingList == 8 || trainingList == 12) {
              pauseTimerFn(60, 1);
            } else if (trainingList == 16) {
              timer.cancel();
//            Map exerciseDoneNum = {widget.exercise[16]['done'] : 'done'};
              Hive.box('winDone').put(widget.exercise['done'], 'done');

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WinScreen(),
              ));
            } else {
              pauseTimerFn(15, 1);
            }
          } else {
            workTime = workTime - 1;
          }
        },
      ),
    );
  }

  void pauseTimerFn(int nowTime, int a) {
    if (nowTime == 15) {
      soundsPauseMin();
    } else if (nowTime == 60) {
      soundsPauseMax();
    }

    pauseTime = nowTime;
    startAfterPauseVar = 3;
    trainingList = trainingList + a;
    pauseStatus = true;
    const oneSec = const Duration(seconds: 1);
    pauseTimer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (pauseTime == 1) {
            soundsPlay2();
          } else if (pauseTime < 6 && pauseTime > 1) {
            soundsPlay1();
          }
          if (pauseTime < 1) {
            timer.cancel();
            workTimerFn(workTime + 45);
          } else {
            pauseTime = pauseTime - 1;
          }
        },
      ),
    );
  }

//  void bigPauseTimerFn(int nowTime, int a) {
//    soundsPauseMax();
//    pauseTime = nowTime;
//    startAfterPauseVar = 4;
//    trainingList = trainingList + a;
//    pauseStatus = true;
//    const oneSec = const Duration(seconds: 1);
//    bigPauseTimer = new Timer.periodic(
//      oneSec,
//      (Timer timer) => setState(
//        () {
//          if (pauseTime == 1) {
//            soundsPlay2();
//          } else if (pauseTime < 6 && pauseTime > 1) {
//            soundsPlay1();
//          }
//          if (pauseTime < 1) {
//            timer.cancel();
//            workTimerFn(workTime + 5);
//          } else {
//            pauseTime = pauseTime - 1;
//          }
//        },
//      ),
//    );
//  }

  dynamic fontSize;
  dynamic homeButtonState;
  int startAfterPauseVar;

  void startAfterPauseFn() {
    switch (startAfterPauseVar) {
      case 1:
        print('1');
        break;
      case 2:
        workTimerFn(workTime);
        break;
      case 3:
        pauseTimerFn(pauseTime, 0);
        break;

      default:
        print('stop');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      homeButtonState = state;
    });

    switch (state) {
      case AppLifecycleState.resumed:
//        print('$workTime, $pauseTime, $bigPauseTime');
        startAfterPauseFn();
//        Navigator.of(context).pop();
        break;
      case AppLifecycleState.inactive:
        // Handle this case
        break;
      case AppLifecycleState.paused:
        dispose();
        break;
      case AppLifecycleState.detached:
        // Handle this case
        break;
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    super.initState();
    startTimerFunk(startTimerCount);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    try{
      workTimer.cancel();
      pauseTimer.cancel();
      startTimer.cancel();
      Wakelock.disable();
      WidgetsBinding.instance.removeObserver(this);
    }catch(e){
      print(e);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleSize = MediaQuery.of(context).size.height / 45;
    fontSize = MediaQuery.of(context).size.height / 40;
    final videoSize = MediaQuery.of(context).size.height / 2;

    return Scaffold(
      backgroundColor: Color(0xFFFFF176),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: (workTime == 0)
                  ? Row(
                      children: <Widget>[
                        if(pauseVisible == 2)
                          IconButton(
                            icon: Icon(MdiIcons.pause),
                            color: Color(0XFF5D5D5D),
                            onPressed: () {
                              setState(() {
                                pauseVisible = 3;
                              });
                              dispose();
                            },
                          )
                        else if(pauseVisible == 3)
                          IconButton(
                            icon: Icon(MdiIcons.play),
                            color: Color(0XFF5D5D5D),
                            onPressed: () {
                              setState(() {
                                pauseVisible = 2;
                              });
                              startAfterPauseFn();
                            },
                          ),

                        Text(
                          ': $pauseTime',
                          style: TextStyle(
                              color: Color(0XFFC74DD4),
                              fontSize: 30,
                              fontFamily: 'Rubik'),
                        ),
                      ],
                    )
                  : Row(
                      children: <Widget>[
                        if(pauseVisible == 2)
                          IconButton(
                            icon: Icon(MdiIcons.pause),
                            color: Color(0XFF5D5D5D),
                            onPressed: () {
                              setState(() {
                                pauseVisible = 3;
                              });
                              dispose();
                            },
                          )
                        else if(pauseVisible == 3)
                          IconButton(
                            icon: Icon(MdiIcons.play),
                            color: Color(0XFF5D5D5D),
                            onPressed: () {
                              setState(() {
                                pauseVisible = 2;
                              });
                              startAfterPauseFn();
                            },
                          ),

                        Text(
                          ': $workTime',
                          style: TextStyle(
                              color: Color(0XFFC74DD4),
                              fontSize: 30,
                              fontFamily: 'Rubik'),
                        ),
                      ],
                    ),
            ),
          )
        ],
        leading: new IconButton(
          icon: new Icon(MdiIcons.close, color: Color(0xFF5D5D5D)),
          onPressed: () {
            startTimer.cancel();
            Navigator.of(context).pop();
          },
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
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(child: child, scale: animation);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          key: ValueKey<int>(trainingList),
          margin: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Stack(alignment: Alignment.center, children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      child: Text(
                        widget.exercise[trainingList]['name'],
                        style: TextStyle(
                          fontFamily: 'RubikL',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: videoSize,
                    child: Image(
                      image: CachedNetworkImageProvider(
                        widget.exercise[trainingList]['path'],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      child: DotsIndicator(
                        dotsCount: widget.exercise.length - 2,
                        position: trainingList.toDouble() - 1,
                        decorator: DotsDecorator(
                          size: const Size.square(5.0),
                          activeSize: const Size(10.0, 5.0),
                          activeColor: Color(0xFFC74DD4),
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
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(child: child, scale: animation);
                },
                child: Center(
                    key: ValueKey<bool>(pauseStatus),
                    child: (pauseStatus == true)
                        ? Container(
                            key: ValueKey<bool>(pauseStatus),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: (trainingList != 17)
                                ? Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        'ОТДЫХ',
                                        style: TextStyle(
                                            fontFamily: 'Rubik', fontSize: 40),
                                      ),
                                      Text(
                                        'СЛЕДУЮЩЕЕ УПРАЖНЕНИЕ',
                                        style: TextStyle(
                                            fontFamily: 'Rubik', fontSize: 15),
                                      ),
                                      Text(
                                        widget.exercise[trainingList]['name'],
                                      ),
                                      SizedBox(
                                        height: videoSize,
                                        child: Image(
                                          image: CachedNetworkImageProvider(
                                            widget.exercise[trainingList]
                                                ['path'],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: DotsIndicator(
                                          dotsCount: widget.exercise.length - 2,
                                          position: trainingList.toDouble() - 1,
                                          decorator: DotsDecorator(
                                            size: const Size.square(5.0),
                                            activeSize: const Size(10.0, 5.0),
                                            activeColor: Color(0xFFC74DD4),
                                            color: Color(0xFF5D5D5D),
                                            spacing: const EdgeInsets.symmetric(
                                                horizontal: 3.0),
                                            activeShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox(),
                          )
                        : null),
              ),
              Center(
                child: (startTimerCount != 0)
                    ? Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0x99FFFFFF),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Center(
                          child: Text(
                            '$startTimerCount',
                            style: TextStyle(
                                fontFamily: 'Rubic',
                                fontSize: 100,
                                color: Color(0XFFC74DD4)),
                          ),
                        ),
                      )
                    : null,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
