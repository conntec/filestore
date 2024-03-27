import 'dart:convert';

Map<String, dynamic> deepMergeMap(
  Map<String, dynamic> object,
  Map<String, dynamic> other,
) {
  return {
    ...object,
    for (var entry in other.entries)
      entry.key: object[entry.key] is Map<String, dynamic> &&
              entry.value is Map<String, dynamic>
          ? deepMergeMap(object[entry.key], entry.value)
          : entry.value
  };
}

Map<String, dynamic> jsonToMap(String input) => jsonDecode(input);

String mapToJson(Map<String, dynamic> input) => jsonEncode(input);
