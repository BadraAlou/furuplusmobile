import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furuplus/models/reservation_hive_model.dart';
import 'package:furuplus/screens/reservation_page.dart';
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
        //Get.snackbar("Réservation annulée", "La réservation a été annulée avec succès.");
        //Get.back(); // Retour à la page précédente après la suppression
        Get.to(() => LocalReservationsScreen());
      },
      onCancel: () {
        Get.back(); // Fermer le dialogue
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('${reservationHiveModel.packName}', style: TextStyle(fontSize: 18.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.w, 15.h, 8.w, 15.h),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.person, size: 20.sp),
                title: Text('NOM: ${reservationHiveModel.firstName} ${reservationHiveModel.lastName}', style: TextStyle(fontSize: 14.sp)),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.card_giftcard_sharp, size: 20.sp),
                title: Text('PACK: ${reservationHiveModel.packName}', style: TextStyle(fontSize: 14.sp)),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.location_pin, size: 20.sp),
                title: Text('ADRESSE: ${reservationHiveModel.address}', style: TextStyle(fontSize: 14.sp)),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.date_range, size: 20.sp),
                title: Text('RESERVATION: ${reservationHiveModel.date}', style: TextStyle(fontSize: 14.sp)),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.date_range, size: 20.sp),
                title: Text('MARIAGE: ${reservationHiveModel.weddingDate}', style: TextStyle(fontSize: 14.sp)),
              ),
            ),
            AdaptiveButton(
                text: 'Annuler',
                icon: Icons.cancel,
                onPressed: () {
                  showCancelDialog(context, reservationHiveModel);
                }
            ),
          ],
        ),
      ),
    );
  }
}
