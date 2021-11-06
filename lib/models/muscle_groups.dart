import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';

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

  static MuscleGroup fromEnumString(String enumString) {
    try {
      return EnumToString.fromString(
        MuscleGroup.values,
        describeEnum(enumString),
      )!;
    } catch (error) {
      throw ErrorDescription(error.toString());
    }
  }
}
