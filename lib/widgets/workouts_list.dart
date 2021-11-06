import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wheel_of_workouts/models/muscle_groups.dart';
import 'package:wheel_of_workouts/models/workout.dart';
import 'package:wheel_of_workouts/models/workout_category.dart';
import 'package:wheel_of_workouts/providers/workouts.dart';
import 'package:wheel_of_workouts/widgets/workout_item.dart';

List<Workout> generateItems(int numberOfItems) {
  return List<Workout>.generate(numberOfItems, (int index) {
    return Workout(
      id: index.toString(),
      name: 'Workout # $index',
      category: WorkoutCategory.abs,
      primary: MuscleGroup.pecs,
      secondary: MuscleGroup.quads,
      setReps: 'set reps',
    );
  });
}

class WorkoutsList extends StatelessWidget {
  WorkoutsList({Key? key}) : super(key: key);

  final List<Workout> generatedWorkouts = generateItems(50);

  @override
  Widget build(BuildContext context) {
    final workouts = Provider.of<WorkoutsProvider>(context).workouts;
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(workouts),
      ),
    );
  }

  Widget _buildPanel(List<Workout> workouts) {
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 2,
      children: workouts.map<ExpansionPanelRadio>((Workout workout) {
        return ExpansionPanelRadio(
          value: Key(workout.id!),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return WorkoutItem(name: workout.name, category: workout.category);
          },
          body: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Primary: ${workout.primary.toFormattedString()}'),
                Text('Secondary: ${workout.secondary.toFormattedString()}'),
              ],
            ),
            subtitle: Text('Sets/Reps: ${workout.setReps}'),
            onTap: () {},
          ),
        );
      }).toList(),
    );
  }
}
