import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheel_of_workouts/models/workout.dart';
import 'package:wheel_of_workouts/providers/current_workouts.dart';
import 'package:wheel_of_workouts/widgets/app_drawer.dart';
import 'package:wheel_of_workouts/widgets/current_workout_item.dart';
import 'package:wheel_of_workouts/widgets/workout_item.dart';

enum CurrentWorkoutMenuOptions { end, clear }

class CurrentWorkoutsScreen extends StatelessWidget {
  const CurrentWorkoutsScreen({Key? key}) : super(key: key);

  static const routeName = '/current-workouts';

  @override
  Widget build(BuildContext context) {
    final List<Workout> currentWorkouts =
        Provider.of<CurrentWorkoutsProvider>(context).currentWorkouts;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Workouts'),
        actions: [
          PopupMenuButton<CurrentWorkoutMenuOptions>(
            onSelected: (CurrentWorkoutMenuOptions option) async {
              switch (option) {
                case CurrentWorkoutMenuOptions.end:
                  final bool? didConfirmChoice = await showDialog<bool>(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text('End Workout?'),
                        content: const Text(
                          'Ending this workout will add one to each workout\' counter and clear current workouts',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              print('end');
                              Navigator.of(context).pop(true);
                            },
                            child: const Text('End Workout'),
                          ),
                        ],
                      );
                    },
                  );
                  if (didConfirmChoice != null) {
                    // selection is true, means workout finished, do something
                    Provider.of<CurrentWorkoutsProvider>(context, listen: false)
                        .clearWorkouts();
                  }
                  break;
                case CurrentWorkoutMenuOptions.clear:
                  final bool? didConfirmChoice = await showDialog<bool>(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text('Clear Workouts?'),
                        content: const Text(
                          'Clearing will remove all current workouts',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              print('clear');
                              Navigator.of(context).pop(true);
                            },
                            child: const Text('Clears Workouts'),
                          ),
                        ],
                      );
                    },
                  );
                  if (didConfirmChoice != null) {
                    Provider.of<CurrentWorkoutsProvider>(context, listen: false)
                        .clearWorkouts();
                  }
                  break;
              }
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<CurrentWorkoutMenuOptions>>[
              const PopupMenuItem<CurrentWorkoutMenuOptions>(
                value: CurrentWorkoutMenuOptions.end,
                child: Text('End Workout'),
              ),
              const PopupMenuItem<CurrentWorkoutMenuOptions>(
                value: CurrentWorkoutMenuOptions.clear,
                child: Text('Clear Workout'),
              ),
            ],
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: currentWorkouts.length,
        itemBuilder: (ctx, index) {
          final curWorkout = currentWorkouts[index];
          return CurrentWorkoutItem(curWorkout);
        },
      ),
    );
  }
}
