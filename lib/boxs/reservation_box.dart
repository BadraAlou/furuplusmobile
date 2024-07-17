import 'package:furuplus/controllers/reservation_controller_hive.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';



class ReservationBox{
  getDatas() {
    return Hive.box("reservationBox").get("datas", defaultValue: []);
  }

  putDatas(List data) async {
    final ReservationHiveController reservationController = Get.find();
    await Hive.box("reservationBox").put("datas", data);
    List datas = getDatas();
    reservationController.setDatas(datas);
  }

  clearBoxData() {
    Hive.box('reservationBox').clear();
  }


}
