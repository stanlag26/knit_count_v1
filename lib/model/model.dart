import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:knit_count_v1/domain/entity/count.dart';


class CountWidgetModel extends ChangeNotifier{
  String nameCount = '';
  String notesCount = '';
  int numberCount = 0;

  void saveCount( BuildContext context) async{
    if (nameCount.isEmpty) return;
    final box = await Hive.openBox<Count>('counts_box');
    final count= Count(nameCount: nameCount, notesCount: notesCount, numberCount: numberCount);
    await box.add(count); //  добавляем сохраненную группу в список
    // print(box.values);
    Navigator.of(context).pop();



  }
}

/////////////////////////////////////////////////////////////////////
class ListCountWidgetModel extends ChangeNotifier {
  var _counts = <Count>[];

  List <Count> get counts => _counts.toList();

  ListCountWidgetModel() {
    _setup();
  }


  void _readCountsFromHive(Box<Count> box) {
    _counts = box.values.toList();
    notifyListeners();
  }

  void _setup() async {
    final box = await Hive.openBox<Count>('counts_box');
    _readCountsFromHive(box);
    box.listenable().addListener(() => _readCountsFromHive(box));
  }

  void deleteCount(int index) async {
    final box = await Hive.openBox<Count>('counts_box');
    await box.deleteAt(index);
  }


  Count? dataCount;
  late int countKey;


  void showCount(BuildContext context, int index)  async {
    final box = await Hive.openBox<Count>('counts_box');
    countKey = box.keyAt(index) as int;
    dataCount = box.get(countKey) as Count;
    Navigator.of(context).pushNamed('/count', arguments: [dataCount, countKey]);
  }


  void plus (Count dataCount, int countKey ) async {

    final box = await Hive.openBox<Count>('counts_box');
    dataCount.numberCount ++;
    box.put(countKey, dataCount);

  }
  void minus (Count dataCount, int countKey ) async {

    final box = await Hive.openBox<Count>('counts_box');
    dataCount.numberCount --;
    box.put(countKey, dataCount);

  }

  void zero (Count dataCount, int countKey ) async {

    final box = await Hive.openBox<Count>('counts_box');
    dataCount.numberCount = 0;
    box.put(countKey, dataCount);

  }

  }







