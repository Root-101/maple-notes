import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';
import 'package:maple_notes/maple_notes.dart';

import '../c_usecase/notes_view_type_usecase.dart';

class NotesViewTypeUseCaseImpl extends SingleKeyValueUseCaseImpl<String, int>
    implements NotesViewTypeUseCase {
  static const String KEY = "maple.notes.view_type";
  static const int DEFAULT_VALUE = 0;
  static const NotesViewTypeEnum DEFAULT_VALUE_OBJECT = NotesViewTypeEnum.LIST;

  NotesViewTypeUseCaseImpl()
      : super(
          key: KEY,
          defaultValue: DEFAULT_VALUE,
          repo: KeyValueRepoModule.buildKeyValueRepo(
            converter: VibrationKeyValueConverter.converter,
            key: KEY,
          ),
        );

  @override
  void changeView(NotesViewTypeEnum type) {
    update(type.index);
  }

  @override
  NotesViewTypeEnum getCurrentValue() {
    int value = read();
    switch (value) {
      case 0:
        return NotesViewTypeEnum.LIST;
      case 1:
        return NotesViewTypeEnum.GRID;
      default:
        return DEFAULT_VALUE_OBJECT;
    }
  }
}

class VibrationKeyValueConverter
    implements SingleKeyValueConverter<String, int> {
  static final VibrationKeyValueConverter converter =
      VibrationKeyValueConverter._();

  VibrationKeyValueConverter._();

  @override
  String keyToString(String key) {
    return key;
  }

  @override
  int stringToValue(String value) {
    return int.parse(value);
  }

  @override
  String valueToString(int value) {
    return value.toString();
  }
}
