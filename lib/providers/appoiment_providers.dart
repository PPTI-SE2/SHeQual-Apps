import 'package:flutter/material.dart';
import 'package:shequal/models/appoiment_model.dart';
import 'package:shequal/services/appoiment_service.dart';

class AppoimentProviders with ChangeNotifier {
  List<AppoimentModel> _appoiments = [];

  List<AppoimentModel> get appoiments => _appoiments;

  set appoiments(List<AppoimentModel> appoiments) {
    _appoiments = appoiments;
    notifyListeners();
  }

  // Future<void> getAppoiments() async {
  //   try {
  //     List<AppoimentModel> appoiments = await AppoimentService().getAppoiments();
  //     _appoiments = appoiments;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<bool> makeAppoiment({
    required String userId,
    required String consultantId,
    required String date,
    required String day,
    required String time,
  }) async {
    try {
      AppoimentModel? appoiment = await AppoimentService().makeAppoiment(
        userId: userId,
        consultantId: consultantId,
        date: date,
        day: day,
        time: time,
      );

      if (appoiment != null) {
        _appoiments.add(appoiment);
        notifyListeners();
      }

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}