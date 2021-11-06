import 'package:enum_to_string/enum_to_string.dart';

enum WorkoutCategory {
  upperBody,
  lowerBody,
  abs,
  cardio,
}

extension WorkoutCategoryExtension on WorkoutCategory {
  String toFormattedString() {
    return EnumToString.convertToString(this, camelCase: true);
  }
}
