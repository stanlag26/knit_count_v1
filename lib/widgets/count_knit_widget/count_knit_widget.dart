
import 'package:flutter/material.dart';
import 'package:knit_count_v1/constants/constants.dart';
import 'package:knit_count_v1/domain/entity/count.dart';
import 'package:knit_count_v1/model/model.dart';
import 'package:provider/provider.dart';

class CountKnitWidgetProvider extends StatelessWidget {
  const CountKnitWidgetProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ListCountWidgetModel(),
        child: const CountKnitWidget());
  }
}




class CountKnitWidget extends StatefulWidget {
  const CountKnitWidget({Key? key}) : super(key: key);

  @override
  State<CountKnitWidget> createState() => _CountKnitWidgetState();
}

class _CountKnitWidgetState extends State<CountKnitWidget> {
  int number = 1;
  void sum () {

  }

  @override
  Widget build(BuildContext context) {
    final model = context.read <ListCountWidgetModel>();
    return Scaffold(
      appBar: AppBar(
        title:  Text(model.dataCount.nameCount),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            Column(
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      primary: mainColor,
                    ),
                    onPressed: () {},
                    child: const Text('65',
                      style: TextStyle(
                        fontSize: 150,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(5.0, 5.0),
                            blurRadius: 10.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    )),

                // const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {},
                    onLongPress: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(128, 116, 214, 1))),
                    child: const Text('Отнять \\ Обнулить')),
                const SizedBox(height: 20),
                const TextField(
                  minLines: 10,
                  maxLines: 10,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: textFieldColor,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(128, 116, 214, 1)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                    hintText: 'В этом полк можно сохранять свои заметки.\n '
                        'При нажатии на число, счетчик увеличивается.\n'
                        'При нажатии на "Отнять \\ Обнулить", счетчик убавится на 1, при долгом нажатии, обнулится.',
                  ),

                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: mainColor,
        child: const Icon(Icons.exit_to_app_sharp),
      ),
    );
  }
}
