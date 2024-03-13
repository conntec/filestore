import 'dart:io';

import 'package:filestore/filestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('localfire', () {
    final db = Filestore.instance;
    test('creates an instance', () {
      expect(db, Filestore.instance);
    });

    test('change the root path', () async {
      final rootPath = Directory('./db_test');
      db.setRootPath(rootPath);
      final doc = db.collection('Users').doc('000');
      final data = {
        'id': '0001',
        'displayName': {'test': 'Chuyen'},
        'value': 'teste',
      };
      await doc.set(data);
      expect(await File(join(rootPath.absolute.path, "Users", "000")).exists(),
          true);
    });

    test('date format save', () async {
      final doc = db.collection('Users').doc('001');
      final data = {
        'id': '0001',
        'displayName': {'test': 'Chuyen'},
        'value': 'teste',
        'date': DateTime.now().toIso8601String(),
      };
      await doc.set(data);
      final expectedData = await doc.get();
      expect(data, expectedData);
    });
    test('creates and updates data', () async {
      Map<String, dynamic> data = {
        'id': '0002',
        'displayName': {'test': 'Chuyen'},
        'value': 'teste',
      };
      final doc = db.collection('Users').doc('002');
      await doc.set(data, merge: true);
      data['value'] = '2';
      await doc.update(data);
      await doc.set(data);
      final expectedDoc = db.collection('Users').doc(doc.id);
      expect(doc, expectedDoc);
      final expectedData = await doc.get();
      expect(data, expectedData);
    });
  });
}
