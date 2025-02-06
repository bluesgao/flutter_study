import 'package:uuid/uuid.dart';

class Gid {
  static String uuidV4() {
    return const Uuid().v4();
  }

  static String uuidV1() {
    return const Uuid().v4();
  }
}
