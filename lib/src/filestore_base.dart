part of filestore;

/// The entry point for accessing a [localfire].
///
/// You can get an instance by calling [localfire.instance], for example:
///
/// ```dart
/// final db = localfire.instance;
/// ```
class Filestore implements FilestoreImpl {
  final _delegate = DocumentRef._('');
  Filestore._();
  static final Filestore _localfire = Filestore._();

  /// Returns an instance using the default [localfire].
  static Filestore get instance => _localfire;

  void setDelegate(Directory dir) {
    _delegate._utils.setDocumentDir(dir);
  }

  @override
  CollectionRef collection(String path) {
    return CollectionRef(path, null, _delegate);
  }
}
