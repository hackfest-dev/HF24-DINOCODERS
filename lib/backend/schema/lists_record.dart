import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListsRecord extends FirestoreRecord {
  ListsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _description = snapshotData['description'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('lists')
          : FirebaseFirestore.instance.collectionGroup('lists');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('lists').doc(id);

  static Stream<ListsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListsRecord.fromSnapshot(s));

  static Future<ListsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListsRecord.fromSnapshot(s));

  static ListsRecord fromSnapshot(DocumentSnapshot snapshot) => ListsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListsRecordData({
  String? name,
  String? image,
  int? price,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'price': price,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListsRecordDocumentEquality implements Equality<ListsRecord> {
  const ListsRecordDocumentEquality();

  @override
  bool equals(ListsRecord? e1, ListsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.price == e2?.price &&
        e1?.description == e2?.description;
  }

  @override
  int hash(ListsRecord? e) =>
      const ListEquality().hash([e?.name, e?.image, e?.price, e?.description]);

  @override
  bool isValidKey(Object? o) => o is ListsRecord;
}
