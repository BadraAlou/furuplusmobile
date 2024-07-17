import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furuplus/models/reservation_hive_model.dart';
import 'package:furuplus/utils/custom_button.dart';
import 'package:get/get.dart';

class ReservationDetailPage extends StatelessWidget {
  const ReservationDetailPage({super.key, required this.reservationHiveModel});
  final ReservationHiveModel reservationHiveModel;

  void showCancelDialog(BuildContext context, ReservationHiveModel reservation) {
    Get.defaultDialog(
      title: 'Annuler la réservation',
      middleText: 'Voulez-vous annuler cette réservation ?',
      textConfirm: 'Annuler',
      textCancel: 'Fermer',
      onConfirm: () {
        reservation.delete();
        Get.back(); // Fermer le dialogue
        Get.snackbar("Réservation annulée", "La réservation a été annulée avec succès.");
        Get.back(); // Retour à la page précédente après la suppression
      },
      onCancel: () {
        Get.back(); // Fermer le dialogue
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${reservationHiveModel.packName}'),),
      body: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('NOM: ${reservationHiveModel.firstName} ${reservationHiveModel.firstName}'),
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.card_giftcard_sharp),
                title: Text('PACK: ${reservationHiveModel.packName}'),
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.location_pin),
                title: Text('ADRESSE: ${reservationHiveModel.address} '),
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.date_range),
                title: Text('RESERVATION: ${reservationHiveModel.date} '),
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.date_range),
                title: Text('MARIAGE: ${reservationHiveModel.weddingDate}'),
              ),
            ),
        




            AdaptiveButton(
                text: 'Annuler',
                icon: Icons.cancel,

                onPressed: () {
                  showCancelDialog(context, reservationHiveModel);
                }
        
            )
          ],
        ),
      ),
    );
  }


}
