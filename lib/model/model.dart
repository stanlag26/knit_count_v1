import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:knit_count_v1/domain/entity/count.dart';


class CountWidgetModel extends ChangeNotifier{
  String nameCount = '';
  String notesCount = '';
  int numberCount = 0;

  void saveCount( BuildContext context) async{
    if (nameCount.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CountAdapter());
    }
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

  // void showForm(BuildContext context, int indexInList) {
  //   Navigator.of(context).pushNamed('/count');
  // }

  void _readCountsFromHive(Box<Count> box) {
    _counts = box.values.toList();
    notifyListeners();
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CountAdapter());
    }
    final box = await Hive.openBox<Count>('counts_box');
    _readCountsFromHive(box);
    box.listenable().addListener(() => _readCountsFromHive(box));
  }

  void deleteCount(int index) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CountAdapter());
    }
    final box = await Hive.openBox<Count>('counts_box');
    await box.deleteAt(index);
  }


  Count dataCount = Count(nameCount: '111', notesCount: '11', numberCount: 11);

  void showCount(BuildContext context, int index)  async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CountAdapter());
    }
    final box = await Hive.openBox<Count>('counts_box');
    final countKey = box.keyAt(index) as int;
    dataCount = box.get(countKey) as Count;
    print(dataCount);

      Navigator.of(context).pushNamed('/count');
  }


}




