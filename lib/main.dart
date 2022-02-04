import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:knit_count_v1/widgets/my_app/my_app.dart';


void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(  const MyApp());
}
