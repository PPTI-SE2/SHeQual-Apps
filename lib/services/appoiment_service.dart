import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shequal/models/appoiment_model.dart';

class AppoimentService {
  String baseUrl = "http://192.168.1.11:8000/api";

  Future<AppoimentModel?> makeAppoiment({
    required String userId,
    required String consultantId,
    required String date,
    required String day,
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
      'day': day,
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
}