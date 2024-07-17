// controllers/reservation_controller.dart

import 'dart:convert';

import 'package:furuplus/models/pack_model.dart';
import 'package:furuplus/models/reservation_model.dart';
import 'package:furuplus/services/api_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ReservationController extends GetxController {
  final ApiService _apiService = ApiService();
  var isLoading = false.obs;
  var isSuccess = false.obs;
  Rx<Pack> selectedPack = Rx<Pack>(Pack(id: 0, name: '', description: '', price: '', image: ''));
  final GetStorage _storage = GetStorage();


  Future<void> submitReservation(Reservation reservation) async {
    isLoading(true);
    isSuccess(false);
    try {
      bool success = await _apiService.createReservation(reservation);
      if (success) {
        isSuccess(true);
      }
    } finally {
      isLoading(false);
    }
  }

  void saveReservationLocal(Reservation reservation) {
    List<String> reservations;
    try {
      reservations = _storage.read<List<String>>('reservations') ?? [];
    } catch(e) {
      reservations = [];
    }
    reservations.add(jsonEncode(reservation.toJsonLocale()));
    _storage.write('reservations', reservations);
  }

  List<Reservation> getLocalReservations() {
    //List<String> reservations = _storage.read<List<String>>('reservations') ?? [];
    List<String> reservations;
    try {
      reservations = _storage.read<List<String>>('reservations') ?? [];
    } catch(e) {
      reservations = [];
    }
    return reservations.map((res) => Reservation.fromJson(jsonDecode(res))).toList();
  }

  void clearLocalReservations() {
    _storage.remove('reservations');
  }
}
