import 'package:hive/hive.dart';

part 'fat_model.g.dart';

@HiveType(typeId: 0)
class FatModel{
  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final double fatResult;



  FatModel({this.date, this.fatResult});


}