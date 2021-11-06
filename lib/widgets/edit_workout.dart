import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:wheel_of_workouts/models/muscle_groups.dart';
import 'package:wheel_of_workouts/models/workout.dart';
import 'package:wheel_of_workouts/models/workout_category.dart';
import 'package:wheel_of_workouts/providers/workouts.dart';

class EditWorkout extends StatelessWidget {
  EditWorkout({Key? key, this.workoutId}) : super(key: key);

  final _form = GlobalKey<FormState>();

  // final _categories = [
  //   <String, dynamic>{
  //     'value': UserType.admin,
  //     'label': 'Admin',
  //   },
  //   <String, dynamic>{
  //     'value': UserType.board_member,
  //     'label': 'Board Member',
  //   },
  //   <String, dynamic>{
  //     'value': UserType.applicant_green,
  //     'label': 'Green Applicant',
  //   },
  //   <String, dynamic>{
  //     'value': UserType.applicant_blue,
  //     'label': 'Blue Applicant',
  //   },
  // ];

  static Map<String, dynamic> Function(WorkoutCategory) mapCategory =
      (WorkoutCategory category) {
    return <String, dynamic>{
      'value': category,
      'label': category.toFormattedString()
    };
  };

  static Map<String, dynamic> Function(MuscleGroup) mapMuscleGroup =
      (MuscleGroup muscleGroup) {
    return <String, dynamic>{
      'value': muscleGroup,
      'label': muscleGroup.toFormattedString()
    };
  };

  final _categories = WorkoutCategory.values.map(mapCategory).toList();
  final _muscleGroups = MuscleGroup.values.map(mapMuscleGroup).toList();
  final String? workoutId;
  final Workout workoutTemplate = Workout(
    name: '',
    category: WorkoutCategory.abs,
    primary: MuscleGroup.biceps,
    secondary: MuscleGroup.biceps,
    setReps: '',
  );

  void _saveForm(BuildContext ctx) {
    final workoutProvider = Provider.of<WorkoutsProvider>(ctx, listen: false);

    final isValid = _form.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    _form.currentState!.save();
    // print(_form..toString());
    if (this.workoutId != null) {
      // update workout
      // workoutProvider.updateWorkout(workoutId!, workout);
    } else {
      // save new workout
      workoutProvider.addWorkout(workoutTemplate);
    }
    print('_saveForm called');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            _saveForm(context);
            Navigator.of(context).pop();
          },
          child: Text('Confirm'),
        ),
      ],
      content: Form(
        key: _form,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: 'init value',
              decoration: const InputDecoration(labelText: 'Name'),
              onSaved: (value) {
                workoutTemplate.name = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            SelectFormField(
              labelText: 'Category',
              initialValue: null,
              items: _categories,
              onSaved: (value) {
                final enumVal = EnumToString.fromString(
                  WorkoutCategory.values,
                  describeEnum(value.toString()),
                );
                workoutTemplate.category = enumVal!;
              },
            ),
            SelectFormField(
              labelText: 'Primary Muscle Group',
              initialValue: null,
              items: _muscleGroups,
              onSaved: (value) {
                final enumVal = EnumToString.fromString(
                  MuscleGroup.values,
                  describeEnum(value.toString()),
                );
                workoutTemplate.primary = enumVal!;
              },
            ),
            SelectFormField(
              labelText: 'Secondary Muscle Group',
              initialValue: null,
              items: _muscleGroups,
              onSaved: (value) {
                final enumVal = EnumToString.fromString(
                  MuscleGroup.values,
                  describeEnum(value.toString()),
                );
                workoutTemplate.secondary = enumVal!;
              },
            ),
            TextFormField(
              // initialValue: 'init value',
              decoration: const InputDecoration(labelText: 'Set/Reps'),
              onSaved: (value) {
                workoutTemplate.setReps = value;
              },
              validator: (value) {},
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}
