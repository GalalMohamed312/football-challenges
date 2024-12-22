
class PasswordChallengeTableModel {
  final int id;
  final List<String> myArrayColumn;

  PasswordChallengeTableModel({required this.id, required this.myArrayColumn});

  factory PasswordChallengeTableModel.fromJson(Map<String, dynamic> json) {
    return PasswordChallengeTableModel(
      id: json['id'] as int,
      myArrayColumn: List<String>.from(json['players'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'my_array_column': myArrayColumn,
    };
  }
}
