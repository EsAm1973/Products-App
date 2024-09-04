import 'package:flutter/material.dart';
import 'package:practice/widgets/BottomNavbar.dart';
import 'package:practice/helpers/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ProductProvider.instance.open();
  await ProductProvider.instance.getproduct();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomNavigation(),
    );
  }
}
