import 'package:flutter/material.dart';
import 'package:wheel_of_workouts/models/muscle_groups.dart';
import 'package:wheel_of_workouts/models/workout_category.dart';

import '../models/workout.dart';

class WorkoutsProvider with ChangeNotifier {
  final List<Workout> _workouts = [
    Workout(
      id: '1',
      name: 'Pushups',
      category: WorkoutCategory.upperBody,
      primary: MuscleGroup.pecs,
      secondary: MuscleGroup.quads,
      setReps: 'set reps',
    ),
    Workout(
      id: '2',
      name: 'Thumbs Up Pushups',
      category: WorkoutCategory.upperBody,
      primary: MuscleGroup.pecs,
      secondary: MuscleGroup.quads,
      setReps: 'set reps',
    ),
    Workout(
      id: '3',
      name: 'Cross Wall Hold',
      category: WorkoutCategory.upperBody,
      primary: MuscleGroup.pecs,
      secondary: MuscleGroup.quads,
      setReps: 'set reps',
    ),
    Workout(
      id: '4',
      name: 'Wide Grip Pullup',
      category: WorkoutCategory.upperBody,
      primary: MuscleGroup.pecs,
      secondary: MuscleGroup.quads,
      setReps: 'set reps',
    ),
    Workout(
      id: '5',
      name: 'Chinups (lean back)',
      category: WorkoutCategory.upperBody,
      primary: MuscleGroup.pecs,
      secondary: MuscleGroup.quads,
      setReps: 'set reps',
    ),
  ];

  List<Workout> get workouts {
    return [..._workouts];
  }

  void addWorkout(Workout workout) {
    workout.id = DateTime.now().toIso8601String();
    _workouts.add(workout);
    notifyListeners();
  }

  void updateWorkout(String id, Workout workout) {}

  void removeWorkout(String id) {
    _workouts.removeWhere((workout) => workout.id == id);
    notifyListeners();
  }
}
