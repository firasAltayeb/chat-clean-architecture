import 'package:hive/hive.dart';

import '../constants/app_constants.dart';
import '../constants/app_keys.dart';

class LocalCacheBox {
  late final Box _box;

  LocalCacheBox._(this._box);

  static LocalCacheBox getInstance() {
    final box = Hive.box(AppConstants.mainBoxName);
    return LocalCacheBox._(box);
  }

  T _getValue<T>(dynamic key, {T? defaultValue}) =>
      _box.get(key, defaultValue: defaultValue) as T;

  Future<void> _setValue<T>(dynamic key, T value) => _box.put(key, value);

  String getChatResponseListJson() {
    if (_getValue(AppKeys.chatResponseListJson) == null) {
      return '';
    }
    return _getValue(AppKeys.chatResponseListJson);
  }

  Future<void> setChatResponseListJson(String value) {
    return _setValue(AppKeys.chatResponseListJson, value);
  }
}
