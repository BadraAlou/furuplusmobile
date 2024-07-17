import 'package:flutter/material.dart';
import 'package:furuplus/controllers/reservation_controller.dart';
import 'package:furuplus/controllers/reservation_controller_hive.dart';
import 'package:furuplus/models/reservation_hive_model.dart';
import 'package:furuplus/models/reservation_model.dart';
import 'package:furuplus/screens/pack_list.dart';
import 'package:furuplus/screens/pack_page.dart';
import 'package:furuplus/screens/reservation_detail.dart';
import 'package:furuplus/themes/theme_helper.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocalReservationsScreen extends StatelessWidget {
  final ReservationController reservationController = Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    List<Reservation> localReservations = reservationController.getLocalReservations();

    return Scaffold(
      appBar: AppBar(
        title: Text('RESERVATIONS', style: TextStyle(fontSize: 20.sp)),
      ),
      body: GetBuilder<ReservationHiveController>(
        builder: (reservationHiveController) {
          return reservationHiveController.datas.isEmpty
              ? Center(child: Text("Aucune Données".tr, style: TextStyle(fontSize: 18.sp)))
              : Column(
            children: [
              // Padding(
              //   padding: EdgeInsets.all(10.w),
              //   child: TextField(
              //     decoration: ThemeHelper().textInputDecoration(
              //       "Rechercher",
              //       "Tapez Votre critère de recherche",
              //       Theme.of(context).primaryColor,
              //     ),
              //     onChanged: (value) {
              //       // Ajoutez ici la logique de recherche si nécessaire
              //     },
              //   ),
              // ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: ListView.builder(
                    itemCount: reservationHiveController.datas.length,
                    itemBuilder: (BuildContext context, int index) {
                      ReservationHiveModel reservationModel = reservationHiveController.datas[index];
                      return Card(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => ReservationDetailPage(reservationHiveModel: reservationModel));
                          },
                          child: ListTile(
                            title: Text(
                              '${reservationModel.firstName} ${reservationModel.lastName} (${reservationModel.packName})',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            subtitle: Text(
                              '${reservationModel.weddingDate}',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            leading: Icon(Icons.card_giftcard, size: 24.sp),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => PackListScreen());
          },
        child: Icon(Icons.add, color: Colors.white, size: 24.sp,),
      ),
    );
  }
}
