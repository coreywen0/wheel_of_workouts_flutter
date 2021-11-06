import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheel_of_workouts/models/muscle_groups.dart';
import 'package:wheel_of_workouts/models/workout.dart';
import 'package:wheel_of_workouts/models/workout_category.dart';
import 'package:wheel_of_workouts/providers/current_workouts.dart';
import 'package:wheel_of_workouts/screens/workouts_overview_screen.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({
    Key? key,
    required this.name,
    required this.category,
  }) : super(key: key);

  final String name;
  final WorkoutCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Text('leading'),
        title: Text(name),
        subtitle: Text(category.toFormattedString()),
        onTap: () {
          print('$name clicked');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$name added to workout'),
              duration: const Duration(seconds: 2),
              action: SnackBarAction(
                label: 'UNDO',
                onPressed: () {
                  // TODO: add workout to current workouts based on id
                },
              ),
            ),
          );
          Provider.of<CurrentWorkoutsProvider>(
            context,
            listen: false,
          ).addWorkout(
            Workout(
              id: DateTime.now().toIso8601String(),
              name: name,
              category: category,
              primary: MuscleGroup.pecs,
              secondary: MuscleGroup.quads,
              setReps: 'set reps',
            ),
          );
        },
      ),
    );
  }
}
