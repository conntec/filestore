import 'dart:convert';

Map<String, dynamic> deepMergeMap(
    Map<String, dynamic> a, Map<String, dynamic> b) {
  b.forEach((k, v) {
    if (!a.containsKey(k)) {
      a[k] = v;
    } else {
      if (a[k] is Map) {
        deepMergeMap(
            Map<String, dynamic>.from(a[k]), Map<String, dynamic>.from(b[k]));
      } else {
        a[k] = b[k];
      }
    }
  });

  return a;
}

Map<String, dynamic> encodeDateInMap(Map<String, dynamic> map) =>
    map.map((k, v) {
      if (v is Map<String, dynamic>) {
        return MapEntry(k, encodeDateInMap(v));
      } else if (v is DateTime) {
        return MapEntry(k, v.toIso8601String());
      } else {
        return MapEntry(k, v);
      }
    });

Map<String, dynamic> decodeDateInMap(Map<String, dynamic> map) =>
    map.map((k, v) {
      if (v is Map<String, dynamic>) {
        return MapEntry(k, decodeDateInMap(v));
      } else if (v is String && DateTime.tryParse(v) != null) {
        return MapEntry(k, DateTime.parse(v));
      } else {
        return MapEntry(k, v);
      }
    });

Map<String, dynamic> jsonToMap(String input) =>
    encodeDateInMap(jsonDecode(input));

String mapToJson(Map<String, dynamic> input) =>
    jsonEncode(encodeDateInMap(input));
