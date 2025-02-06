import 'package:get_storage/get_storage.dart';

class Store {
  static final _store = GetStorage();

  // 保存数据
  static void write(String key, dynamic value) {
    _store.write(key, value);
  }

  // 读取数据
  static dynamic read(String key) {
    return _store.read(key);
  }

  // 保存数据并存储过期时间
  static void writeWithExpiry(String key, dynamic value, Duration expiry) {
    final int expiryTimestamp =
        DateTime.now().millisecondsSinceEpoch + expiry.inMilliseconds;
    _store.write(key, value);
    _store.write('${key}_expiry', expiryTimestamp);
  }

  // 读取数据（自动检查是否过期）
  static dynamic readWithExpiry(String key) {
    final int? expiryTimestamp = _store.read('${key}_expiry');

    if (expiryTimestamp != null) {
      final int now = DateTime.now().millisecondsSinceEpoch;
      if (now > expiryTimestamp) {
        // 数据已过期，删除
        _store.remove(key);
        _store.remove('${key}_expiry');
        return null;
      }
    }
    return _store.read(key);
  }

  // 删除数据
  static void remove(String key) {
    _store.remove(key);
    _store.remove('${key}_expiry');
  }
}
