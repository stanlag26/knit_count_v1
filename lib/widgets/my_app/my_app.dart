import 'package:flutter/material.dart';
import 'package:knit_count_v1/constants/constants.dart';
import 'package:knit_count_v1/widgets/add_count_widget/add_count_widget.dart';
import 'package:knit_count_v1/widgets/count_knit_widget/count_knit_widget.dart';
import 'package:knit_count_v1/widgets/list_counts_widget/list_counts_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Count_Knit',
      theme: ThemeData(
        scaffoldBackgroundColor: frontColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: mainColor,
            iconTheme: IconThemeData(color: Colors.white),
            actionsIconTheme: IconThemeData(color: Colors.amber),
            centerTitle: true,
            elevation: 15,
          )),
      routes: {
        '/': (context) => const ListCountsProviderWidget(),
        '/form': (context) => const AddCountProviderWidget(),
        '/count': (context) => const CountKnitWidgetProvider()
      },
      initialRoute: '/',
    );
  }
}
