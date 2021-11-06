import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheel_of_workouts/widgets/app_drawer.dart';
import 'package:wheel_of_workouts/widgets/edit_workout.dart';
import 'package:wheel_of_workouts/widgets/workout_item.dart';
import 'package:wheel_of_workouts/widgets/workouts_list.dart';

import '../providers/workouts.dart';

class WorkoutsOverviewScreen extends StatelessWidget {
  const WorkoutsOverviewScreen({Key? key}) : super(key: key);

  static const routeName = '/workouts';

  @override
  Widget build(BuildContext context) {
    final workouts = Provider.of<WorkoutsProvider>(context).workouts;
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Workout'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  return EditWorkout();
                },
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: WorkoutsList(),
    );
  }
}
