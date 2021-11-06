import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:wheel_of_workouts/models/muscle_groups.dart';
import 'package:wheel_of_workouts/models/workout.dart';
import 'package:wheel_of_workouts/models/workout_category.dart';

class CurrentWorkoutItem extends StatefulWidget {
  const CurrentWorkoutItem(this.workout, {Key? key}) : super(key: key);

  final Workout workout;

  @override
  _CurrentWorkoutItemState createState() => _CurrentWorkoutItemState();
}

class _CurrentWorkoutItemState extends State<CurrentWorkoutItem> {
  bool isCompleted = false;

  late final Workout workout;

  @override
  void initState() {
    workout = widget.workout;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          setState(() {
            isCompleted = !isCompleted;
          });
        },
        icon: isCompleted
            ? const Icon(Icons.check, color: Colors.green)
            : const Icon(
                Icons.local_pizza_outlined,
                color: Colors.red,
              ),
      ),
      title: Text(workout.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(workout.category.toFormattedString()),
          Text(workout.primary.toFormattedString()),
          Text(workout.secondary.toFormattedString()),
        ],
      ),
    );
  }
}
