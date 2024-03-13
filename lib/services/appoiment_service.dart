import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shequal/models/appoiment_model.dart';
import 'package:shequal/models/consultant_model.dart';

class AppoimentService {
  String baseUrl = "http://192.168.130.163:8000/api";

  Future<List<AppoimentModel?>?> getAppoimentByUserId({
    required String userId,
  }) async {
    var url = Uri.parse("$baseUrl/userAppointment?users_id=$userId");

    var response = await http.get(url);

    print(response.body);
    if(response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<AppoimentModel?> appoiments = [];

      for (var item in data) {
        appoiments.add(AppoimentModel.fromJson(item));
      }

      return appoiments;
    }

    return null;
  }

  Future<AppoimentModel?> makeAppoiment({
    required String userId,
    required String consultantId,
    required String date,
    required String time,
  }) async {
    var url = Uri.parse("$baseUrl/consulForm");

    var headers = {
      'content-type': 'application/json',
    };

    var body = jsonEncode({
      'users_id': userId,
      'consultants_id': consultantId,
      'date': date,
      'time': time,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);
    if(response.statusCode == 200) {
      print("Berhasil Buat Appoiment");
      return AppoimentModel.fromJson(jsonDecode(response.body)['data']);
    }

    return null;
  }

  Future<List<ConsultantModel?>?> getConsultantByDate({
    required String date,
    required String time,
  }) async {
    var url = Uri.parse("$baseUrl/getConsultant");

    var headers = {
      'content-type': 'application/json',
    };

    var body = jsonEncode({
      'date': date,
      'time': time,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);
    if(response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<ConsultantModel?> consultants = [];

      for (var item in data) {
        consultants.add(ConsultantModel.fromJson(item));
      }

      return consultants;
    }

    return null;
  }
}