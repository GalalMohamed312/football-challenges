import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/password_challenge_table_model.dart';

class PasswordChallengeLocalDataSource {
  static const String tableBoxName = 'passwordChallengeTable';
  static const String levelKey = 'currentLevel';


  Box? box;

  Future<Box>initializeHive({required  boxName})async{
    if (Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox(boxName);
  }

  Future<void> saveTable(List<PasswordChallengeTableModel>  table) async {
    final box = await initializeHive(boxName: tableBoxName);
    await box.put('tableData', table);
  }

  Future<List<Map<String, dynamic>>?> getTable() async {
    box = await Hive.openBox(tableBoxName);
    return box?.get('passwordChallengeTableData')?.cast<Map<String, dynamic>>();
  }

  Future<void> saveCurrentLevel(int level) async {
    final box = await initializeHive(boxName: levelKey);
    await box?.put('level', level);
  }

  Future<int?> getCurrentLevel() async {
    final box = await Hive.openBox(levelKey);
    return box.get('level');
  }
}
