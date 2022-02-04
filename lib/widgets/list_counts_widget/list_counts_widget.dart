import 'package:flutter/material.dart';
import 'package:knit_count_v1/constants/constants.dart';
import 'package:knit_count_v1/model/model.dart';
import 'package:provider/provider.dart';


class ListCountsProviderWidget extends StatelessWidget {
  const ListCountsProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ListCountWidgetModel(),
        child: const ListCountsWidget());
  }
}


class ListCountsWidget extends StatelessWidget {
  const ListCountsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.watch <ListCountWidgetModel>();
    final _listCount = model.counts.length;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Счетчик вязания'),
      ),
      body: ListView.separated(
          itemCount: _listCount,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return CountCard(indexInList: index);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.pushNamed(context, '/form');
        },
        backgroundColor: const Color.fromRGBO(128, 116, 214, 1),
        child: const Icon(Icons.add),
      ),

    );

  }
}



class CountCard extends StatelessWidget {
  final int indexInList;
  const CountCard({Key? key, required this.indexInList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read <ListCountWidgetModel>();
    return  Card(
      child: ListTile(
        tileColor: frontColor,
          onTap: () =>model.showCount(context, indexInList),
          leading: Image.asset('images/ball.png',width: 40),
          title: Text(model.counts[indexInList].nameCount),
          subtitle: Text(model.counts[indexInList].numberCount.toString() + ' ряд.'),
          trailing: IconButton(
              onPressed: () => model.deleteCount(indexInList),
              icon: const Icon(Icons.delete, color: Colors.deepOrange,))
      ),
      elevation: 8,
      shadowColor: mainColor,
    );
  }
}
