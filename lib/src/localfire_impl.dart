part of localfire;

/// The interface that other localfire must extend.
abstract class LocalFireImpl {
  /// Gets a [CollectionRef] for the specified localfire path.
  CollectionRef collection(String path);
}
