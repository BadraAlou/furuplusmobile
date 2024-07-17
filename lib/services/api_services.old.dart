// services/api_service.dart

import 'dart:convert';
import 'package:furuplus/models/pack_model.dart';
import 'package:furuplus/models/reservation_model.dart';
import 'package:http/http.dart' as http;


class ApiService {
  //final String baseUrl = 'http://localhost:8000';
  final String baseUrl = 'https://furu-plus.com';

  //Future<List<Pack>> fetchPacks() async {
  Future<dynamic> fetchPacks() async {
    final response = await http.get(Uri.parse('$baseUrl/api/packs/'));

    if (response.statusCode == 200) {
      print('*** yo response: ${response.body}');
      //List jsonResponse = json.decode(response.body);

      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> packsJson = jsonResponse['results'];

      //List jsonResponse = jsonDecode(response.body);
      return packsJson.map((pack) => Pack.fromJson(pack)).toList();
      //return jsonResponse.map((pack) => Pack.fromJson(pack)).toList();
    } else {
      throw Exception('Failed to load packs');
    }
  }

  Future<bool> createReservation(Reservation reservation) async {
    print('*** Reservation Création: ${reservation.firstName}');
    print('*** Reservation Création: ${json.encode(reservation.toJson())}');
    final response = await http.post(
      Uri.parse('$baseUrl/api/reservations/'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(reservation.toJson()),
    );

    return response.statusCode == 201;
  }
}
