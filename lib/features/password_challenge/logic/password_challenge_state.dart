import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/password_challenge_table_model.dart';

part 'password_challenge_state.freezed.dart';

@freezed
class PasswordChallengeState with _$PasswordChallengeState {
  const factory PasswordChallengeState.initial() = _Initial;
  const factory PasswordChallengeState.loading() = _Loading;
  const factory PasswordChallengeState.increaseCurrentPlayerIdState() = _IncreaseCurrentPlayerIdState;
  const factory PasswordChallengeState.goToNextLevelState() = _GoToNextLevel;

  const factory PasswordChallengeState.loaded(List<PasswordChallengeTableModel> items) = Loaded;
  const factory PasswordChallengeState.error(String message) = _Error;
}
