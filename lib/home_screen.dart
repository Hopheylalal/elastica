import 'package:elastica/training_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/main_screen_fat_widget.dart';
import 'common/training_db.dart';
import 'package:hive/hive.dart';

const double widthBorder = 0;
const double cupImgHeight = 70;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final winDone = Hive.box('winDone');

  @override
  Widget build(BuildContext context) {
//    final widthBorder = MediaQuery.of(context).size.height ;
    return Scaffold(
      backgroundColor: Color(0xFFFFF176),
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(

        slivers: <Widget>[
         SliverAppBar(
              automaticallyImplyLeading: false,
              floating: false,
              backgroundColor: Colors.transparent,
              expandedHeight: 255,
              flexibleSpace: FlexibleSpaceBar(background: FatWidget()),
            ),
          
          SliverFixedExtentList(
            itemExtent: 175,
            delegate: SliverChildListDelegate(
              [
                WeekWidget(
                  text: 'Тренировочная неделя 1',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_1),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_2),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_3),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('1')
                      : ((winDone.get('1')) == 'done'
                          ? Image.asset('lib/assets/cups/31.png', height: cupImgHeight)
                          : TextExercise('1')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('2')
                      : ((winDone.get('2')) == 'done'
                          ? Image.asset('lib/assets/cups/1.png', height: cupImgHeight)
                          : TextExercise('2')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('3')
                      : ((winDone.get('3')) == 'done'
                          ? Image.asset('lib/assets/cups/2.png', height: cupImgHeight)
                          : TextExercise('3')),
                ),
                WeekWidget(
                  text: 'Тренировочная неделя 2',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_4),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_5),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_6),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('4')
                      : ((winDone.get('4')) == 'done'
                          ? Image.asset('lib/assets/cups/3.png', height: cupImgHeight)
                          : TextExercise('4')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('5')
                      : ((winDone.get('5')) == 'done'
                          ? Image.asset('lib/assets/cups/4.png', height: cupImgHeight)
                          : TextExercise('5')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('6')
                      : ((winDone.get('6')) == 'done'
                          ? Image.asset('lib/assets/cups/5.png', height: cupImgHeight)
                          : TextExercise('6')),
                ),

                WeekWidget(
                  text: 'Тренировочная неделя 3',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_7),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_8),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_9),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('7')
                      : ((winDone.get('7')) == 'done'
                      ? Image.asset('lib/assets/cups/6.png', height: cupImgHeight)
                      : TextExercise('7')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('8')
                      : ((winDone.get('8')) == 'done'
                      ? Image.asset('lib/assets/cups/7.png', height: cupImgHeight)
                      : TextExercise('8')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('9')
                      : ((winDone.get('9')) == 'done'
                      ? Image.asset('lib/assets/cups/8.png', height: cupImgHeight)
                      : TextExercise('9')),
                ),

                WeekWidget(
                  text: 'Тренировочная неделя 4',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_10),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_11),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_12),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('10')
                      : ((winDone.get('10')) == 'done'
                      ? Image.asset('lib/assets/cups/9.png', height: cupImgHeight)
                      : TextExercise('10')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('11')
                      : ((winDone.get('11')) == 'done'
                      ? Image.asset('lib/assets/cups/10.png', height: cupImgHeight)
                      : TextExercise('11')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('12')
                      : ((winDone.get('12')) == 'done'
                      ? Image.asset('lib/assets/cups/11.png', height: cupImgHeight)
                      : TextExercise('12')),
                ),
                WeekWidget(
                  text: 'Тренировочная неделя 5',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_13),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_14),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_15),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('13')
                      : ((winDone.get('13')) == 'done'
                      ? Image.asset('lib/assets/cups/12.png', height: cupImgHeight)
                      : TextExercise('13')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('14')
                      : ((winDone.get('14')) == 'done'
                      ? Image.asset('lib/assets/cups/13.png', height: cupImgHeight)
                      : TextExercise('14')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('15')
                      : ((winDone.get('15')) == 'done'
                      ? Image.asset('lib/assets/cups/14.png', height: cupImgHeight)
                      : TextExercise('15')),
                ),
                WeekWidget(
                  text: 'Тренировочная неделя 6',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_16),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_17),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_18),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('16')
                      : ((winDone.get('16')) == 'done'
                      ? Image.asset('lib/assets/cups/15.png', height: cupImgHeight)
                      : TextExercise('16')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('17')
                      : ((winDone.get('17')) == 'done'
                      ? Image.asset('lib/assets/cups/16.png', height: cupImgHeight)
                      : TextExercise('17')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('18')
                      : ((winDone.get('18')) == 'done'
                      ? Image.asset('lib/assets/cups/17.png', height: cupImgHeight)
                      : TextExercise('18')),
                ),
                WeekWidget(
                  text: 'Тренировочная неделя 7',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_19),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_20),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_21),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('19')
                      : ((winDone.get('19')) == 'done'
                      ? Image.asset('lib/assets/cups/18.png', height: cupImgHeight)
                      : TextExercise('19')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('20')
                      : ((winDone.get('20')) == 'done'
                      ? Image.asset('lib/assets/cups/19.png', height: cupImgHeight)
                      : TextExercise('20')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('21')
                      : ((winDone.get('21')) == 'done'
                      ? Image.asset('lib/assets/cups/20.png', height: cupImgHeight)
                      : TextExercise('21')),
                ),

                WeekWidget(
                  text: 'Тренировочная неделя 8',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_22),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_23),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_24),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('22')
                      : ((winDone.get('22')) == 'done'
                      ? Image.asset('lib/assets/cups/21.png', height: cupImgHeight)
                      : TextExercise('22')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('23')
                      : ((winDone.get('23')) == 'done'
                      ? Image.asset('lib/assets/cups/22.png', height: cupImgHeight)
                      : TextExercise('23')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('24')
                      : ((winDone.get('24')) == 'done'
                      ? Image.asset('lib/assets/cups/23.png', height: cupImgHeight)
                      : TextExercise('24')),
                ),

                WeekWidget(
                  text: 'Тренировочная неделя 9',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_25),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_26),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_27),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('25')
                      : ((winDone.get('25')) == 'done'
                      ? Image.asset('lib/assets/cups/24.png', height: cupImgHeight)
                      : TextExercise('25')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('26')
                      : ((winDone.get('26')) == 'done'
                      ? Image.asset('lib/assets/cups/25.png', height: cupImgHeight)
                      : TextExercise('26')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('27')
                      : ((winDone.get('27')) == 'done'
                      ? Image.asset('lib/assets/cups/26.png', height: cupImgHeight)
                      : TextExercise('27')),
                ),
                WeekWidget(
                  text: 'Тренировочная неделя 10',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_28),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_29),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_30),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('28')
                      : ((winDone.get('28')) == 'done'
                      ? Image.asset('lib/assets/cups/27.png', height: cupImgHeight)
                      : TextExercise('28')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('29')
                      : ((winDone.get('29')) == 'done'
                      ? Image.asset('lib/assets/cups/28.png', height: cupImgHeight)
                      : TextExercise('29')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('30')
                      : ((winDone.get('30')) == 'done'
                      ? Image.asset('lib/assets/cups/29.png', height: cupImgHeight)
                      : TextExercise('30')),
                ),

                WeekWidget(
                  text: 'Тренировочная неделя 11',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_31),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_32),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_33),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('31')
                      : ((winDone.get('31')) == 'done'
                      ? Image.asset('lib/assets/cups/30.png', height: cupImgHeight)
                      : TextExercise('31')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('32')
                      : ((winDone.get('32')) == 'done'
                      ? Image.asset('lib/assets/cups/1.png', height: cupImgHeight)
                      : TextExercise('32')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('33')
                      : ((winDone.get('33')) == 'done'
                      ? Image.asset('lib/assets/cups/2.png', height: cupImgHeight)
                      : TextExercise('33')),
                ),

                WeekWidget(
                  text: 'Тренировочная неделя 12',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_34),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_35),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_36),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('34')
                      : ((winDone.get('34')) == 'done'
                      ? Image.asset('lib/assets/cups/3.png', height: cupImgHeight)
                      : TextExercise('34')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('35')
                      : ((winDone.get('35')) == 'done'
                      ? Image.asset('lib/assets/cups/4.png', height: cupImgHeight)
                      : TextExercise('35')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('36')
                      : ((winDone.get('36')) == 'done'
                      ? Image.asset('lib/assets/cups/5.png', height: cupImgHeight)
                      : TextExercise('36')),
                ),

                WeekWidget(
                  text: 'Тренировочная неделя 13',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_37),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_38),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_39),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('37')
                      : ((winDone.get('37')) == 'done'
                      ? Image.asset('lib/assets/cups/6.png', height: cupImgHeight)
                      : TextExercise('37')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('38')
                      : ((winDone.get('38')) == 'done'
                      ? Image.asset('lib/assets/cups/7.png', height: cupImgHeight)
                      : TextExercise('38')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('39')
                      : ((winDone.get('39')) == 'done'
                      ? Image.asset('lib/assets/cups/8.png', height: cupImgHeight)
                      : TextExercise('39')),
                ),
                WeekWidget(
                  text: 'Тренировочная неделя 14',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_40),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_41),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_42),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('40')
                      : ((winDone.get('40')) == 'done'
                      ? Image.asset('lib/assets/cups/9.png', height: cupImgHeight)
                      : TextExercise('40')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('41')
                      : ((winDone.get('41')) == 'done'
                      ? Image.asset('lib/assets/cups/10.png', height: cupImgHeight)
                      : TextExercise('41')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('42')
                      : ((winDone.get('42')) == 'done'
                      ? Image.asset('lib/assets/cups/11.png', height: cupImgHeight)
                      : TextExercise('42')),
                ),
                WeekWidget(
                  text: 'Тренировочная неделя 15',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_43),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_44),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_45),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('43')
                      : ((winDone.get('43')) == 'done'
                      ? Image.asset('lib/assets/cups/12.png', height: cupImgHeight)
                      : TextExercise('43')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('44')
                      : ((winDone.get('44')) == 'done'
                      ? Image.asset('lib/assets/cups/13.png', height: cupImgHeight)
                      : TextExercise('44')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('45')
                      : ((winDone.get('45')) == 'done'
                      ? Image.asset('lib/assets/cups/14.png', height: cupImgHeight)
                      : TextExercise('45')),
                ),
                WeekWidget(
                  text: 'Тренировочная неделя 16',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_46),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_47),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_48),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('46')
                      : ((winDone.get('46')) == 'done'
                      ? Image.asset('lib/assets/cups/15.png', height: cupImgHeight)
                      : TextExercise('46')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('47')
                      : ((winDone.get('47')) == 'done'
                      ? Image.asset('lib/assets/cups/16.png', height: cupImgHeight)
                      : TextExercise('47')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('48')
                      : ((winDone.get('48')) == 'done'
                      ? Image.asset('lib/assets/cups/17.png', height: cupImgHeight)
                      : TextExercise('48')),
                ),

                WeekWidget(
                  text: 'Тренировочная неделя 17',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_49),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_50),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_51),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('49')
                      : ((winDone.get('49')) == 'done'
                      ? Image.asset('lib/assets/cups/18.png', height: cupImgHeight)
                      : TextExercise('49')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('50')
                      : ((winDone.get('50')) == 'done'
                      ? Image.asset('lib/assets/cups/19.png', height: cupImgHeight)
                      : TextExercise('50')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('51')
                      : ((winDone.get('51')) == 'done'
                      ? Image.asset('lib/assets/cups/20.png', height: cupImgHeight)
                      : TextExercise('51')),
                ),

                WeekWidget(
                  text: 'Тренировочная неделя 18',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_52),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_53),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_54),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('52')
                      : ((winDone.get('52')) == 'done'
                      ? Image.asset('lib/assets/cups/21.png', height: cupImgHeight)
                      : TextExercise('52')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('53')
                      : ((winDone.get('53')) == 'done'
                      ? Image.asset('lib/assets/cups/22.png', height: cupImgHeight)
                      : TextExercise('53')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('54')
                      : ((winDone.get('54')) == 'done'
                      ? Image.asset('lib/assets/cups/23.png', height: cupImgHeight)
                      : TextExercise('54')),
                ),

                WeekWidget(
                  text: 'Тренировочная неделя 19',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_55),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_56),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_57),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('55')
                      : ((winDone.get('55')) == 'done'
                      ? Image.asset('lib/assets/cups/24.png', height: cupImgHeight)
                      : TextExercise('55')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('56')
                      : ((winDone.get('56')) == 'done'
                      ? Image.asset('lib/assets/cups/25.png', height: cupImgHeight)
                      : TextExercise('56')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('57')
                      : ((winDone.get('57')) == 'done'
                      ? Image.asset('lib/assets/cups/26.png', height: cupImgHeight)
                      : TextExercise('57')),
                ),

                WeekWidget(
                  text: 'Тренировочная неделя 20',
                  trainingButton1: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_58),
                      ),
                    );
                  },
                  trainingButton2: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_59),
                      ),
                    );
                  },
                  trainingButton3: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrainingScreen(Exercises.day_60),
                      ),
                    );
                  },
                  buttonText1: (winDone.isEmpty)
                      ? TextExercise('58')
                      : ((winDone.get('58')) == 'done'
                      ? Image.asset('lib/assets/cups/27.png', height: cupImgHeight)
                      : TextExercise('58')),
                  buttonText2: (winDone.isEmpty)
                      ? TextExercise('59')
                      : ((winDone.get('59')) == 'done'
                      ? Image.asset('lib/assets/cups/28.png', height: cupImgHeight)
                      : TextExercise('59')),
                  buttonText3: (winDone.isEmpty)
                      ? TextExercise('60')
                      : ((winDone.get('60')) == 'done'
                      ? Image.asset('lib/assets/cups/29.png', height: cupImgHeight)
                      : TextExercise('60')),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WeekWidget extends StatelessWidget {
  final String text;
  final Widget buttonText1;
  final Widget buttonText2;
  final Widget buttonText3;
  final Function trainingButton1;
  final Function trainingButton2;
  final Function trainingButton3;

  WeekWidget(
      {this.text,
      this.trainingButton1,
      this.trainingButton2,
      this.trainingButton3,
      this.buttonText1,
      this.buttonText2,
      this.buttonText3});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 173,
      child: Card(
        elevation: 1,
        color: Color(0xFFFFFBD8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                text,
                style: TextStyle(fontSize: 17, fontFamily: 'Rubik'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: MaterialButton(
                        height: 75,
                        color: Colors.white,
                        elevation: 1.0,
                        shape: CircleBorder(),
                        child: buttonText1,
                        onPressed: trainingButton1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: MaterialButton(
                        height: 75,
                        color: Colors.white,
                        elevation: 1.0,
                        shape: CircleBorder(),
                        child: buttonText2,
                        onPressed: trainingButton2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: MaterialButton(
                        height: 75,
                        color: Colors.white,
                        elevation: 1.0,
                        shape: CircleBorder(),
                        child: buttonText3,
                        onPressed: trainingButton3,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextExercise extends StatelessWidget {
  final String num;

  TextExercise(this.num);

  @override
  Widget build(BuildContext context) {
    return Text(
      num,
      style: TextStyle(
        color: Color(0xFF5D5D5D),
        fontSize: 35,
        fontFamily: 'Rubik',
      ),
    );
  }
}
