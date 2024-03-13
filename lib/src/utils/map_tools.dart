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

Map<String, dynamic> jsonToMap(String input) => jsonDecode(input);

String mapToJson(Map<String, dynamic> input) => jsonEncode(input);
