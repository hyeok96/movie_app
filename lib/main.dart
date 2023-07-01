import 'package:flutter/material.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/view/screens/movie_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MovieProvider(),
          )
        ],
        child: MovieList(),
      ),
    );
  }
}
