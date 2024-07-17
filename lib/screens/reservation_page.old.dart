// local_reservations_screen.dart

import 'package:flutter/material.dart';
import 'package:furuplus/controllers/reservation_controller.dart';
import 'package:furuplus/models/reservation_model.dart';
import 'package:get/get.dart';


class LocalReservationsScreenOld extends StatelessWidget {
  //final ReservationController reservationController = Get.find<ReservationController>();
  final ReservationController reservationController = Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    List<Reservation> localReservations = reservationController.getLocalReservations();

    return Scaffold(
      appBar: AppBar(
        title: Text('Local Reservations'),
      ),
      body: ListView.builder(
        itemCount: localReservations.length,
        itemBuilder: (context, index) {
          Reservation reservation = localReservations[index];
          return ListTile(
            title: Text('${reservation.firstName} ${reservation.lastName} (${reservation.packName})'),
            subtitle: Text('Wedding Date: ${reservation.weddingDate}'),
          );
        },
      ),
    );
  }
}
