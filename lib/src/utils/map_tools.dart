Map<String, dynamic> deepMergeMap(
    Map<String, dynamic> a, Map<String, dynamic> b) {
  b.forEach((k, v) {
    if (!a.containsKey(k)) {
      a[k] = v;
    } else {
      if (a[k] is Map) {
        deepMergeMap(a[k], b[k]);
      } else {
        a[k] = b[k];
      }
    }
  });

  return a;
}
