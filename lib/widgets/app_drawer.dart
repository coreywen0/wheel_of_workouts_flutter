import 'package:flutter/material.dart';
import 'package:wheel_of_workouts/screens/current_workouts_overview_screen.dart';
import 'package:wheel_of_workouts/screens/workouts_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: Text('Workouts List'),
          onTap: () {
            print('nav to workouts list');
            Navigator.of(context)
                .pushReplacementNamed(WorkoutsOverviewScreen.routeName);
          },
        ),
        ListTile(
          title: Text('Current Workouts'),
          onTap: () {
            print('nav to cur workouts');
            Navigator.of(context)
                .pushReplacementNamed(CurrentWorkoutsScreen.routeName);
          },
        ),
      ],
    ));
  }
}
