import 'package:flutter/material.dart';
import 'package:wheel_of_workouts/models/muscle_groups.dart';
import 'package:wheel_of_workouts/models/workout_category.dart';

import '../models/workout.dart';

class CurrentWorkoutsProvider with ChangeNotifier {
  final List<Workout> _currentWorkouts = [
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
  ];

  List<Workout> get currentWorkouts {
    return [..._currentWorkouts];
  }

  void addWorkout(Workout workout) {
    _currentWorkouts.add(workout);
    notifyListeners();
  }

  void updateWorkout(String id, Workout workout) {}

  void removeWorkout(String id) {
    _currentWorkouts.removeWhere((workout) => workout.id == id);
    notifyListeners();
  }

  void endWorkout() {
    _currentWorkouts.clear();
    // add 1 to workouts counter
  }

  void clearWorkouts() {
    _currentWorkouts.clear();
    print('clearWorkouts called');
    notifyListeners();
  }
}
