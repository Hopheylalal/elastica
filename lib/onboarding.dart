import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hive/hive.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_screen.dart';



class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  dynamic fontSize;
  int fat_1age = 0;

  final ageBox = Hive.box('ageHive');

  void showColoredToast() {
    Fluttertoast.showToast(
        msg: "Укажите ваш возраст",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Color(0XFFC74DD4),
        textColor: Colors.white,
        timeInSecForIos: 2);
  }

  @override
  Widget build(BuildContext context) {
    final videoSize = MediaQuery.of(context).size.height / 2.5;

    fontSize = MediaQuery.of(context).size.height / 40;



    final List<PageViewModel> pages = [
      PageViewModel(
        title: 'Тренируйся дома',
        image: Center(
          child: Image.asset(
            'lib/assets/img/Group1.png',
            height: videoSize,
          ),
        ),
        bodyWidget: Text(
          'Тренировки с помощью фитнес лент гораздо эффективнее тренировок с собственным весом. Во время занятий с фитнес-лентой вы сможете легко регулировать нагрузку за счет амплитуды растяжения. Кроме того, этот мини-эспандер не вредит скелетной мускулатуре и суставно-связочному аппарату.',
          style: TextStyle(
            fontFamily: 'RubikL',
            color: Color(0xFF5D5D5D),
            fontSize: fontSize,
          ),
        ),
      ),
      PageViewModel(
        title: 'Полноценная тренировка',
        image: Center(
          child: Image.asset(
            'lib/assets/img/Group2.png',
            height: videoSize,
          ),
        ),
        bodyWidget: Text(
          'Эластичная фитнес-лента обеспечат вам: Повышение силы и упругости мышц, избавление от проблемных зон, улучшение качества тела, укрепление мышечного корсета, качественную работу над ягодичными мышцами, минимальное давление на суставно-связочный аппарат.',
          style: TextStyle(
            fontFamily: 'RubikL',
            color: Color(0xFF5D5D5D),
            fontSize: fontSize,
          ),
        ),
      ),
      PageViewModel(
        title: 'Удобство использования',
        image: Center(
          child: Image.asset(
            'lib/assets/img/Group3.png',
            height: videoSize,
          ),
        ),
        bodyWidget: Text(
          'Эластичные фитнес-ленты имеют несколько уровней нагрузки в зависимости от жесткости резины: мягкий, средний, жесткий, очень жесткий. Уровень сопротивления резинки во время выполнения упражнений выбирайте по своим возможностям.',
          style: TextStyle(
            fontFamily: 'RubikL',
            color: Color(0xFF5D5D5D),
            fontSize: fontSize,

          ),
        ),
      ),
      PageViewModel(
        title: 'Укажите ваш возраст',
        image: Center(
          child: Image.asset(
            'lib/assets/img/Group55.png',
            height: videoSize,
          ),
        ),
        bodyWidget: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                '$fat_1age',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 40,
                  color: Color(0XFFC74DD4),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Slider(
                value: fat_1age.toDouble(),
                min: 0,
                max: 70,
                activeColor: Color(0XFFC74DD4),
                inactiveColor: Color(0xFFC9C9C9),
                onChanged: (double newValue) {
                  setState(() {
                    fat_1age = newValue.round();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFFFF176),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Card(
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
              onDone: () async{
                if (fat_1age > 0) {
                   Hive.box('ageHive').put('age', fat_1age);
                   print(Hive.box('ageHive').get('age'));

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                }else{
                  showColoredToast();
                }
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
      ),
    );
  }
}
