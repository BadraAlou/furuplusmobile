// main.dart

import 'package:flutter/material.dart';
import 'package:furuplus/controllers/pack_controller.dart';
import 'package:furuplus/controllers/reservation_controller.dart';
import 'package:furuplus/screens/pack_detail_page.dart';
import 'package:get/get.dart';

class PackListScreen extends StatelessWidget {
  final PackController packController = Get.put(PackController());
  final ReservationController reservationController = Get.put(ReservationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Packs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          if (packController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: packController.packs.length,
              itemBuilder: (context, index) {
                final pack = packController.packs[index];

                return Card(
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      reservationController.selectedPack.value = pack;
                      Get.to(() => PackDetailPage(pack: pack,));
                    },
                    child: ListTile(
                      leading: Image.network(pack.image, width: 60, height: 80,),
                      title: Text(pack.name),
                      //subtitle: Text(pack.description),
                      subtitle: Text('${pack.price} fcfa'),
                      trailing: Icon(Icons.check_circle_outline),
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
