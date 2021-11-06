import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:wheel_of_workouts/models/workout_category.dart';

class EditWorkout extends StatelessWidget {
  EditWorkout({Key? key}) : super(key: key);

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

  static Map<String, dynamic> Function(WorkoutCategory) mapCategoryFunc =
      (WorkoutCategory category) {
    return <String, dynamic>{
      'value': category,
      'label': category.toFormattedString()
    };
  };

  final _categories = WorkoutCategory.values.map(mapCategoryFunc).toList();

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    // print(_form..toString());
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
            _saveForm();
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
              onSaved: (value) {},
              validator: (value) {},
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            SelectFormField(
              labelText: 'Category',
              initialValue: null,
              items: _categories,
            ),
            TextFormField(
              initialValue: 'init value',
              decoration: const InputDecoration(labelText: 'Set/Reps'),
              onSaved: (value) {},
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
