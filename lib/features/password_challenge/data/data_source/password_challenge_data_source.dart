import 'package:flutter/cupertino.dart';
import 'package:foot/features/password_challenge/data/models/password_challenge_table_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class PasswordChallengeDataSource {
  final SupabaseClient client;

  PasswordChallengeDataSource(this.client);

  Future<List<PasswordChallengeTableModel>> fetchItems() async {
    debugPrint("wait");
    final response = await client.from('password_challenge').select("*");
    debugPrint(response.toString());
    return response.map((item) =>  PasswordChallengeTableModel.fromJson(item)).toList();
  }
  Future<void> addItem(PasswordChallengeTableModel model) async {
    final response = await client
        .from('password_challenge') // Replace with your table name
        .insert(model.toJson());

    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }
}
