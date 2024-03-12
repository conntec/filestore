part of filestore;

/// The interface that other localfire must extend.
abstract class FilestoreImpl {
  /// Gets a [CollectionRef] for the specified localfire path.
  CollectionRef collection(String path);
}
