import 'package:enum_to_string/enum_to_string.dart';

enum MuscleGroup {
  pecs,
  upperBack,
  biceps,
  fullBack,
  quads,
}

extension MuscleGroupExtension on MuscleGroup {
  String toFormattedString() {
    return EnumToString.convertToString(this, camelCase: true);
  }
}
