import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furuplus/controllers/pack_controller.dart';
import 'package:furuplus/controllers/reservation_controller.dart';
import 'package:furuplus/screens/pack_detail_page.dart';
import 'package:get/get.dart';

class PackListScreen extends StatelessWidget {
  final PackController packController = Get.put(PackController());
  final ReservationController reservationController = Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Packs', style: TextStyle(fontSize: 18.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.w),
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
                      Get.to(() => PackDetailPage(pack: pack));
                    },
                    child: ListTile(
                      leading: Image.network(
                        pack.image,
                        width: 50.w,
                        height: 80.h,
                        fit: BoxFit.cover, // Adjust the image to cover the box
                      ),
                      title: Text(pack.name, style: TextStyle(fontSize: 16.sp)),
                      subtitle: Text('${pack.price} fcfa', style: TextStyle(fontSize: 14.sp)),
                      trailing: Icon(Icons.check_circle_outline, size: 20.sp),
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
