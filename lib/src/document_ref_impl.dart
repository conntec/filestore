part of localfire;

/// The interface that other DocumentRef must extend.
abstract class DocumentRefImpl {
  /// Gets a [CollectionRef] for the specified localfire path.
  CollectionRef collection(String path);

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  /// document instead of overwriting.
  Future<dynamic> set(Map<String, dynamic> data, {bool merge = false});

  // Update the document referenced by this [DocumentRef].
  Future<dynamic> update(Map<String, dynamic> data);

  /// Reads the document referenced by this [DocumentRef].
  Future<Map<String, dynamic>?> get();

  /// Deletes the current document from the collection.
  Future delete();
}
