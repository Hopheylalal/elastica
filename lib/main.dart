import 'package:elastica/home_screen.dart';
import 'package:elastica/widgets/newwi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';


import 'chart/fat_model.dart';
import 'onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
  await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(FatModelAdapter());
  var fatBox3 = await Hive.openBox('fatBox3');
  var winDone = await Hive.openBox('winDone');
  var firstTimeHive = await Hive.openBox('firstTime');
  var ageHive = await Hive.openBox('ageHive');

  runApp(
    Elastica(),
    
  );
}

//class FirstStart extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    if (Hive.box('ageHive').isEmpty) {
//      return MaterialApp(home: OnBoardingScreen(), color: Color(0xFFFFF176),);
//    }else{
//      return Elastica();
//    }
//
//  }
//}


class Elastica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setPreferredOrientations(
//        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
////        statusBarColor: Colors.white,
////        statusBarIconBrightness: Brightness.dark,
//        systemNavigationBarColor: Colors.white,
//        systemNavigationBarIconBrightness: Brightness.dark));

    return ChangeNotifierProvider(
        create: (context) => StatusMain(),
      child: MaterialApp(
//      locale: DevicePreview.of(context).locale,
//      builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Color(0xFFFFF176),
              textTheme: TextTheme(
                body1: TextStyle(
                  color: Color(0xFF5D5D5D),
                ),
              )),
          home:
          (Hive.box('ageHive').isEmpty) ? OnBoardingScreen() : HomeScreen()


      ),
    );
  }
}
