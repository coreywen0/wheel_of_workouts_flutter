import 'package:wheel_of_workouts/models/muscle_groups.dart';
import 'package:wheel_of_workouts/models/workout_category.dart';

class Workout {
  Workout({
    this.id,
    required this.name,
    required this.category,
    required this.primary,
    required this.secondary,
    required this.setReps,
    this.count = 0,
  });

  String? id;
  String name;
  WorkoutCategory category;
  MuscleGroup primary;
  MuscleGroup secondary;
  String? setReps;
  num count;
}
