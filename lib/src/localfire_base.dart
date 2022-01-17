part of localfire;

/// The entry point for accessing a [localfire].
///
/// You can get an instance by calling [localfire.instance], for example:
///
/// ```dart
/// final db = localfire.instance;
/// ```
class LocalFire implements LocalFireImpl {
  final _delegate = DocumentRef._('');
  LocalFire._();
  static final LocalFire _localfire = LocalFire._();

  /// Returns an instance using the default [localfire].
  static LocalFire get instance => _localfire;

  @override
  CollectionRef collection(String path) {
    return CollectionRef(path, null, _delegate);
  }
}
