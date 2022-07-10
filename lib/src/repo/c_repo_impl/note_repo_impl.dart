import 'package:clean_core/clean_core.dart';
import 'package:flutter/material.dart';
import 'package:maple_notes/maple_notes.dart';

class NoteRepoImpl
    extends DefaultCRUDRepo<NoteDomain, NoteEntity, NoteRepoExternal>
    implements NoteRepo {
  NoteRepoImpl(NoteRepoExternal repoExternal)
      : super(
          externalRepo: repoExternal,
          converter: NoteConverter.converter,
        );
}

class NoteConverter extends GeneralConverter<NoteDomain, NoteEntity> {
  static final NoteConverter converter = NoteConverter._();

  NoteConverter._();

  @override
  NoteDomain toDomain(NoteEntity entity) {
    return NoteDomain(
      id: entity.id,
      title: entity.title,
      content: entity.content,
      color: Color(entity.color),
    );
  }

  @override
  NoteEntity toEntity(NoteDomain domain) {
    return NoteEntity.build(
      id: domain.id,
      title: domain.title,
      content: domain.content,
      color: domain.color.value,
    );
  }
}
