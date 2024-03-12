import 'package:flutter/material.dart';
import 'package:shequal/models/appoiment_model.dart';
import 'package:shequal/models/consultant_model.dart';
import 'package:shequal/services/appoiment_service.dart';

class AppoimentProviders with ChangeNotifier {
  List<AppoimentModel?> _appoiments = [];

  List<AppoimentModel?> get appoiments => _appoiments;

  List<ConsultantModel?> _consultants = [];

  List<ConsultantModel?> get consultants => _consultants;

  set appoiments(List<AppoimentModel?> appoiments) {
    _appoiments = appoiments;
    notifyListeners();
  }

  Future<bool> getAppoimentByUserId({
    required String userId,
  }) async {
    try {
      List<AppoimentModel?>? appoiments = await AppoimentService().getAppoimentByUserId(
        userId: userId,
      );

      if (appoiments!.isNotEmpty) {
        _appoiments = appoiments;
        notifyListeners();

        return true;
      }

      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> makeAppoiment({
    required String userId,
    required String consultantId,
    required String date,
    required String time,
  }) async {
    try {
      AppoimentModel? appoiment = await AppoimentService().makeAppoiment(
        userId: userId,
        consultantId: consultantId,
        date: date,
        time: time,
      );

      if (appoiment != null) {
        _appoiments.add(appoiment);
        notifyListeners();

        return true;
      }

      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> getConsultantByDate ({
    required String date,
    required String time,
  }) async {
    try {
      
      List<ConsultantModel?>? consultants = await AppoimentService().getConsultantByDate(
        date: date,
        time: time,
      );

      if (consultants != null) {
        _consultants = consultants;
        notifyListeners();

        return true;
      }

      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}