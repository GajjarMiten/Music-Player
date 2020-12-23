import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  static void init() async {
    WidgetsFlutterBinding.ensureInitialized();

    var appDir = await getApplicationDocumentsDirectory();
    var path = appDir.path;

    Hive.init(path);
  }

  void saveCurrentSong() {}
}
