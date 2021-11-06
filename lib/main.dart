import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheel_of_workouts/providers/current_workouts.dart';
import 'package:wheel_of_workouts/providers/workouts.dart';
import 'package:wheel_of_workouts/screens/current_workouts_overview_screen.dart';
import 'package:wheel_of_workouts/screens/workouts_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext ctx) => WorkoutsProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext ctx) => CurrentWorkoutsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: WorkoutsOverviewScreen(),
        routes: {
          WorkoutsOverviewScreen.routeName: (ctx) => WorkoutsOverviewScreen(),
          CurrentWorkoutsScreen.routeName: (ctx) => CurrentWorkoutsScreen()
        },
      ),
    );
  }
}
