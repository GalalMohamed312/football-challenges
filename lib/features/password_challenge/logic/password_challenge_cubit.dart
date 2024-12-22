import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foot/features/password_challenge/data/models/password_challenge_table_model.dart';
import 'package:foot/features/password_challenge/logic/password_challenge_state.dart';

import '../data/data_source/password_challenge_data_source.dart';
import '../data/data_source/password_challenge_local_data_source.dart';


class PasswordChallengeCubit extends Cubit<PasswordChallengeState> {
  final PasswordChallengeDataSource _dataSource;
  final PasswordChallengeLocalDataSource _passwordChallengeLocalDataSource;
  PasswordChallengeCubit(this._dataSource,this._passwordChallengeLocalDataSource) : super(const PasswordChallengeState.initial());

  int  get currentPlayerIndex => _currentPlayerIndex;
   int _currentPlayerIndex = 0;

  int  get currentWinIndex => _currentWinIndex;
  int _currentWinIndex = -1;

  int _playersIdsLegnth=0;

  int  get currentLevel => _currentLevel;
   int _currentLevel = 0;

  int  get team1Score => _team1Score;
   int _team1Score= 0;

  int  get team2Score => _team2Score;
   int _team2Score = 0;

  List<PasswordChallengeTableModel> _items = []; // Your loaded data

  void refreshScreen() {
    final currentState = state;
    if (currentState is Loaded) {
      emit(const PasswordChallengeState.loading());
      emit(
        PasswordChallengeState.loaded(
          currentState.items, // retain current items
        ),
      );
    }
  }

  void updateLoadedState(){
    emit(
        PasswordChallengeState.loaded(
          _items, // retain current items
        ));

  }

  Future<void> saveItemsLocal({required passwordChallengeTable})async{
    await _passwordChallengeLocalDataSource.saveTable(passwordChallengeTable);
  }

  Future<void> saveLevelLocal({required levelNumber})async{
    await _passwordChallengeLocalDataSource.saveCurrentLevel(levelNumber);
  }

  Future<void> loadDataLocallyOrRemotely() async{
    emit(const PasswordChallengeState.loading());
    try {
      debugPrint("loading");
      final results = await Future.wait([
        _passwordChallengeLocalDataSource.getTable(),
        _passwordChallengeLocalDataSource.getCurrentLevel(),
      ]);
      final items = results[0] ; // Result of getTable()
      _currentLevel = results[1]==null?0:results[1]as int; // Result of getCurrentLevel()
      if (items!=null) {
        emit(PasswordChallengeState.loaded(items as List<PasswordChallengeTableModel>));
        _items = items;

        _playersIdsLegnth=items.length;
        debugPrint(items.toString());
        debugPrint(items.length.toString());
      }
      else{
        loadItems();
      }

    } catch (e) {
      debugPrint("error=${e.toString()}");
      emit(PasswordChallengeState.error(e.toString()));
    }
  }


  Future<void> loadItems() async {
    emit(const PasswordChallengeState.loading());
    try {
      debugPrint("loading");
      final items = await _dataSource.fetchItems();
      debugPrint("loaded");
      emit(PasswordChallengeState.loaded(items));
      saveItemsLocal(passwordChallengeTable: items);
      _items = items;
      _playersIdsLegnth=items.length;
      debugPrint(items.toString());
      debugPrint(items.length.toString());
    } catch (e) {
      debugPrint("error=");
      debugPrint(AutofillHints.email.toString());
      emit(PasswordChallengeState.error(e.toString()));
    }
  }

  Future<void> addItem(PasswordChallengeTableModel model) async {
    try {
      await _dataSource.addItem(model);
      loadItems(); // Refresh the data after adding an item
    } catch (e) {
      emit(PasswordChallengeState.error(e.toString()));
    }
  }

  void whoIsTeamWin({required int winIndex}){
    if (winIndex==0) {
      _team1Score++;
      debugPrint("team1=$_team1Score");
    }
    else if (winIndex==1) {
      _team2Score++;
      debugPrint("team2=$_team2Score");
    }
    increaseCurrentPlayerIndex();
    refreshScreen();
  }
  void increaseCurrentPlayerIndex(){
   if (currentPlayerIndex>=7) {
     _team2Score=0;
     _team1Score=0;
     _currentPlayerIndex=0;
     goToNextLevel();
   }
   else{
     _currentPlayerIndex++;
   }
  }
  void goToNextLevel(){
    if( _currentLevel+1==_playersIdsLegnth){
      emit(const PasswordChallengeState.increaseCurrentPlayerIdState());
    }
    else {
      _currentLevel++;
      saveLevelLocal(levelNumber: _currentLevel);
      emit(const PasswordChallengeState.goToNextLevelState());
    }
  }
}
