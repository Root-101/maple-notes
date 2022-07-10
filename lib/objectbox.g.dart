// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/repo/b_entities/entities.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 650181728446293843),
      name: 'NoteEntity',
      lastPropertyId: const IdUid(4, 2306339325158868224),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5296854757946903594),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1528127127693613542),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2994949010183609206),
            name: 'content',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2306339325158868224),
            name: 'color',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 650181728446293843),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    NoteEntity: EntityDefinition<NoteEntity>(
        model: _entities[0],
        toOneRelations: (NoteEntity object) => [],
        toManyRelations: (NoteEntity object) => {},
        getId: (NoteEntity object) => object.id,
        setId: (NoteEntity object, int id) {
          object.id = id;
        },
        objectToFB: (NoteEntity object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final contentOffset = fbb.writeString(object.content);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, contentOffset);
          fbb.addInt64(3, object.color);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = NoteEntity(
              title: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              content: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              color:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [NoteEntity] entity fields to define ObjectBox queries.
class NoteEntity_ {
  /// see [NoteEntity.id]
  static final id =
      QueryIntegerProperty<NoteEntity>(_entities[0].properties[0]);

  /// see [NoteEntity.title]
  static final title =
      QueryStringProperty<NoteEntity>(_entities[0].properties[1]);

  /// see [NoteEntity.content]
  static final content =
      QueryStringProperty<NoteEntity>(_entities[0].properties[2]);

  /// see [NoteEntity.color]
  static final color =
      QueryIntegerProperty<NoteEntity>(_entities[0].properties[3]);
}
